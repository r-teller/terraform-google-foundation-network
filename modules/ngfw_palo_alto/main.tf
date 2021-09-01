resource "google_storage_bucket" "bucket" {
  name                        = "${var.project}-${var.zone}-${var.firewall_name}"
  project                     = var.project
  location                    = var.region
  storage_class               = "NEARLINE"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "config" {
  name   = "config/"
  content = "..."
  bucket = google_storage_bucket.bucket.name
  depends_on = [
    google_storage_bucket.bucket
  ]

}

resource "google_storage_bucket_object" "content" {
  name   = "content/"
  content = "..."
  bucket = google_storage_bucket.bucket.name
  depends_on = [
    google_storage_bucket.bucket
  ]
}

resource "google_storage_bucket_object" "software" {
  name   = "software/"
  content = "..."
  bucket = google_storage_bucket.bucket.name
  depends_on = [
    google_storage_bucket.bucket
  ]

}

resource "google_storage_bucket_object" "pulgins" {
  name   = "pulgins/"
  content = "..."
  bucket = google_storage_bucket.bucket.name
  depends_on = [
    google_storage_bucket.bucket
  ]

}

resource "google_compute_address" "external_address" {
  for_each     = { for k, v in var.interfaces : k => v if v.externalEnabled }
  name         = "${each.value.network}-${var.firewall_name}-ext"
  project      = var.project
  region       = var.region
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}


resource "google_compute_address" "internal_address" {
  for_each     = var.interfaces
  name         = "${each.value.network}-${var.firewall_name}-int"
  project      = var.project
  region       = var.region
  address_type = "INTERNAL"
  purpose      = "GCE_ENDPOINT"
  subnetwork   = each.value.subnetwork
  address      = each.value.internalAddress
}

resource "google_compute_instance" "firewall" {
  count                     = var.bootstrap_files_staged ? 1 : 0
  name                      = var.firewall_name
  project                   = var.project
  machine_type              = var.machine_type
  zone                      = var.zone
  deletion_protection       = var.deletion_protection
  can_ip_forward            = true
  allow_stopping_for_update = true
  tags                      = concat(["ngfw"], var.tags)

  metadata = {
    mgmt-interface-swap                  = var.mgmt_interface_swap
    vmseries-bootstrap-gce-storagebucket = google_storage_bucket.bucket.name
    allow_stopping_for_update            = true
    serial-port-enable                   = true
    block-project-ssh-keys               = var.block_project_ssh_keys
    ssh-keys                             = "admin:${var.ssh_key}"
  }

  service_account {
    scopes = var.scopes
  }

  dynamic "network_interface" {
    for_each = var.interfaces
    content {
      network_ip = network_interface.value.internalAddress
      subnetwork = network_interface.value.subnetwork
      dynamic "access_config" {
        for_each = network_interface.value.externalEnabled ? [1] : []
        content {
          nat_ip = [
            for external_address in google_compute_address.external_address : external_address.address
          if 0 < length(regexall(network_interface.value.network, external_address.name))][0]
        }
      }
    }
  }

  boot_disk {
    initialize_params {
      image = var.image
      type  = "pd-ssd"
    }
  }
}