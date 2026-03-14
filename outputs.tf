output "vm_name" {
  value = google_compute_instance.web_vm.name
}

output "vm_public_ip" {
  value = google_compute_instance.web_vm.network_interface[0].access_config[0].nat_ip
}

output "vpc_id" {
  value = google_compute_network.vpc_lab3.id
}