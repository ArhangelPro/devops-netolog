resource "yandex_compute_disk" "empty-disk" {
  name       = "empty-disk-${count.index + 1}"
  type       = "network-hdd"
  zone       = "ru-central1-a"
  size       = 1
  count = 3
}

resource "yandex_compute_instance" "storage" {
  name          = "storage"
  zone          = "ru-central1-a"
  platform_id   = "standard-v1"
    resources {
        cores  = 2
        memory = 1
        core_fraction = 5
    }

    boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }
    
    dynamic "secondary_disk" {
       for_each = local.secondary_disk
       content{
        disk_id = secondary_disk.value.id
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
        ssh-keys = local.ssh_key
    }
}