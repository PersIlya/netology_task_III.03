
resource "yandex_vpc_network" "develop" {
  name = "net1"
}

resource "yandex_vpc_subnet" "develop" {
  name           = yandex_vpc_network.develop.name
  zone           = var.YaCloud.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.YaCloud.default_cidr
}

data "yandex_compute_image" "centos" {
  family = "centos-7-oslogin" 
}

resource "yandex_compute_instance" "machine" {
  count = 3 

  connection {
        type     = local.ssh_opt.proto
        user     = local.ssh_opt.user_name
        host     = self.network_interface.0.nat_ip_address 
        private_key = local.ssh_opt.pubkey
        timeout     = local.ssh_opt.time
  }

  name        = var.vms_name[count.index]
  hostname    = var.vms_name[count.index] 
  platform_id = "standard-v1"

  resources {
    cores         = var.vms_resources.cpu
    memory        = var.vms_resources.ram
    core_fraction = var.vms_resources.fract
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
      type     = var.vms_resources.disk_type
      size     = var.vms_resources.disk_size
    }
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "${local.ssh_opt.user_name}:${local.ssh_opt.pubkey}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}
