resource "yandex_compute_instance" "databases" {
    depends_on = [
   yandex_compute_instance.web
  ]
    for_each = { for key, value in var.vms_resources : key => value }
    name        = each.value["vm_name"]
    platform_id = each.value["platform_id"]
    resources {
        cores = each.value["cpu"]
        memory = each.value["ram"]
        core_fraction = each.value["core_fraction"]
        

    }

    boot_disk {
        initialize_params {
            size = each.value["disk"]
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
        ssh-keys = local.ssh_key

  }


}