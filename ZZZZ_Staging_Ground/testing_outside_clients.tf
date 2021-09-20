# data "google_compute_default_service_account" "outside_client" {
#   project = local.project_id
# }

# resource "google_compute_instance" "usc1_outside_client_01" {
#   project = local.project_id

#   name = "${local.prefix}-${local.environment}-usc1-outside-client-01"

#   machine_type = "e2-micro"
#   zone         = "us-central1-a"
#   tags         = ["us-central1", "us-central1-a", "allow-gcp-iap"]

#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2004-lts"
#     }
#   }

#   network_interface {
#     network    = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside-usc1", network.name))][0]
#     subnetwork = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside-usc1", subnetwork.name)) && subnetwork.region == "us-central1"][0]
#   }

#   service_account {
#     email  = data.google_compute_default_service_account.outside_client.email
#     scopes = ["cloud-platform"]
#   }

#   depends_on = [
#     google_compute_network.network,
#     google_compute_subnetwork.subnetwork,
#   ]
# }

# # resource "google_compute_instance" "use4_outside_client_01" {
# #   project = local.project_id

# #   name = "${local.prefix}-${local.environment}-use4-outside-client-01"

# #   machine_type = "e2-micro"
# #   zone         = "us-east4-a"
# #   tags         = ["us-east4", "us-east4-a", "allow-gcp-iap"]

# #   boot_disk {
# #     initialize_params {
# #       image = "ubuntu-os-cloud/ubuntu-2004-lts"
# #     }
# #   }

# #   network_interface {
# #     network    = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0]
# #     subnetwork = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][1]
# #   }

# #   service_account {
# #     email  = data.google_compute_default_service_account.outside_client.email
# #     scopes = ["cloud-platform"]
# #   }

# #   depends_on = [
# #     google_compute_network.network,
# #     google_compute_subnetwork.subnetwork,
# #   ]
# # }