output "zone" {
  value = can(google_compute_instance.firewall[0]) ? google_compute_instance.firewall[0].zone : null
}
output "name" {
  value = can(google_compute_instance.firewall[0]) ? google_compute_instance.firewall[0].name : null
}
output "self_link" {
  value = can(google_compute_instance.firewall[0]) ? google_compute_instance.firewall[0].self_link : null    
}
output "primary_network" {
    value = can(google_compute_instance.firewall[0]) ? google_compute_instance.firewall[0].network_interface[0].network : null
}
output "external_mgmt_address" {
  value = can(google_compute_address.external_address[0]) ? var.mgmt_interface_swap == "enable" ? google_compute_address.external_address[1].address :google_compute_address.external_address[0].address : null 
}