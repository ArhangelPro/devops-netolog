resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.family
}
resource "yandex_compute_instance" "platform" {  
  name        = local.web
  platform_id = var.resource.vm_web_platform_id
    resources {
      cores         = var.vms_resources["vm_web"]["cores"]
      memory        = var.vms_resources["vm_web"]["memory"]
      core_fraction = var.vms_resources["vm_web"]["core_fraction"]
    }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = local.meta[1]
    ssh-keys           = local.meta[0]
  }

}

resource "yandex_compute_instance" "vm_db_platform" {  

  name        = local.db
  platform_id = var.resource.vm_db_platform_id
    resources {
      cores         = var.vms_resources["vm_db"]["cores"]
      memory        = var.vms_resources["vm_db"]["memory"]
      core_fraction = var.vms_resources["vm_db"]["core_fraction"]
    }
boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = local.meta[1]
    ssh-keys           = local.meta[0]
  }

}