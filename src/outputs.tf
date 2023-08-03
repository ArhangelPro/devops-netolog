output "vm_web_xternal_ip" {
value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}
output "vm_db_xternal_ip" {
value = yandex_compute_instance.vm_db_platform.network_interface.0.nat_ip_address
}