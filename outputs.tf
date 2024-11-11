
output "machine_1" {
    value = "${yandex_compute_instance.machine[0].name} on ${yandex_compute_instance.machine[0].network_interface.0.nat_ip_address}"
}
output "machine_2" {
    value = "${yandex_compute_instance.machine[1].name} on ${yandex_compute_instance.machine[1].network_interface.0.nat_ip_address}"
}
output "machine_3" {
    value = "${yandex_compute_instance.machine[2].name} on ${yandex_compute_instance.machine[2].network_interface.0.nat_ip_address}"
}

output "ssh_key" {
    value = "${local.ssh_opt.pubkey}"
}
