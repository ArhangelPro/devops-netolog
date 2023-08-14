resource "yandex_compute_instance" "databases" {
    depends_on = [
   yandex_compute_instance.web
  ]
    for_each = toset(["0", "1"])
    name        = var.vms_resources[each.key].vm_name
    platform_id = "standard-v1"
    resources {
        cores         = var.vms_resources[each.key].cpu
        memory        = var.vms_resources[each.key].ram
        core_fraction = var.vms_resources[each.key].core_fraction
        

    }

    boot_disk {
        initialize_params {
            size = var.vms_resources[each.key].disk
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