resource "yandex_compute_instance" "web" {
  name        = "web-${count.index + 1}"
  platform_id = "standard-v1"
  
  count = 2

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
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [var.security_group_ids]
  }

  metadata = {
    ssh-keys = local.ssh_key
  }
}

