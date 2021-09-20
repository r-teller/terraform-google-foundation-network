# module "palo_alto_01" {
#   source  = "r-teller/appliance-paloalto/google"
#   version = "0.9.0-beta"

#   depends_on = [
#     google_compute_network.network,
#     google_compute_subnetwork.subnetwork,
#   ]

#   project                = local.project_id
#   ssh_key                = file("./ngfw_ssh_key.pub")
#   firewall_name          = "palo-alto-01"
#   region                 = "us-central1"
#   zone                   = "us-central1-a"
#   tags                   = ["us-central1", "us-central1-a", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
#   bootstrap_files_staged = true
#   interfaces = {
#     0 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
#       externalEnabled = false,
#     },
#     1 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
#       externalEnabled = true,
#     },
#     2 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
#       externalEnabled = false,
#     },
#     3 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0], 2),
#       externalEnabled = false,
#     },
#   }
# }

# module "palo_alto_02" {
#   source  = "r-teller/appliance-paloalto/google"
#   version = "0.9.0-beta"

#   depends_on = [
#     google_compute_network.network,
#     google_compute_subnetwork.subnetwork,
#   ]

#   project                = local.project_id
#   ssh_key                = file("./ngfw_ssh_key.pub")
#   firewall_name          = "palo-alto-02"
#   region                 = "us-central1"
#   zone                   = "us-central1-b"
#   tags                   = ["us-central1", "us-central1-b", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
#   bootstrap_files_staged = true
#   interfaces = {
#     0 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
#       externalEnabled = false,
#     },
#     1 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
#       externalEnabled = true,
#     },
#     2 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
#       externalEnabled = false,
#     },
#     3 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-central1"][0], 3),
#       externalEnabled = false,
#     },
#   }
# }

# module "palo_alto_03" {
#   source  = "r-teller/appliance-paloalto/google"
#   version = "0.9.0-beta"

#   depends_on = [
#     google_compute_network.network,
#     google_compute_subnetwork.subnetwork,
#   ]

#   project                = local.project_id
#   ssh_key                = file("./ngfw_ssh_key.pub")
#   firewall_name          = "palo-alto-03"
#   region                 = "us-east4"
#   zone                   = "us-east4-a"
#   tags                   = ["us-east4", "us-east4-a", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
#   bootstrap_files_staged = true
#   interfaces = {
#     0 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
#       externalEnabled = false,
#     },
#     1 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
#       externalEnabled = true,
#     },
#     2 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
#       externalEnabled = false,
#     },
#     3 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0], 2),
#       externalEnabled = false,
#     },
#   }
# }

# module "palo_alto_04" {
#   source  = "r-teller/appliance-paloalto/google"
#   version = "0.9.0-beta"

#   depends_on = [
#     google_compute_network.network,
#     google_compute_subnetwork.subnetwork,
#   ]

#   project                = local.project_id
#   ssh_key                = file("./ngfw_ssh_key.pub")
#   firewall_name          = "palo-alto-04"
#   region                 = "us-east4"
#   zone                   = "us-east4-b"
#   tags                   = ["us-east4", "us-east4-b", "allow-gcp-iap", "allow-all-rfc1918", "allow-gcp-gfe"]
#   bootstrap_files_staged = true
#   interfaces = {
#     0 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("outside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("outside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
#       externalEnabled = false,
#     },
#     1 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("mgmt", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("mgmt", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
#       externalEnabled = true,
#     },
#     2 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("inside", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("inside", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
#       externalEnabled = false,
#     },
#     3 = {
#       network         = [for network in google_compute_network.network : network.name if 0 < length(regexall("dmz", network.name))][0],
#       subnetwork      = [for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.id if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0],
#       internalAddress = cidrhost([for subnetwork in google_compute_subnetwork.subnetwork : subnetwork.ip_cidr_range if 0 < length(regexall("dmz", subnetwork.name)) && subnetwork.region == "us-east4"][0], 3),
#       externalEnabled = false,
#     },
#   }
# }