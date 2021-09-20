# data "google_compute_default_service_account" "mgmt_client" {
#   project = local.project_id
# }

# resource "google_compute_instance" "usc1_mgmt_client_01" {
#   project = local.project_id

#   name = "${local.prefix}-${local.environment}-usc1-mgmt-client-01"

#   machine_type = "e2-micro"
#   zone         = "us-central1-a"
#   tags         = ["us-central1", "us-central1-a", "allow-gcp-iap"]

#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2004-lts"
#     }
#   }

#   network_interface {
#     network    = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0]
#     subnetwork = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0]
#     network_ip = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0], -10)
#   }

#   service_account {
#     email = data.google_compute_default_service_account.mgmt_client.email
#     scopes = [
#       "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
#       "https://www.googleapis.com/auth/devstorage.read_only",
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring.write",
#       "https://www.googleapis.com/auth/cloud-platform",
#     ]
#   }

#   depends_on = [
#     google_compute_network.network,
#     google_compute_subnetwork.subnetwork,
#   ]
# }
