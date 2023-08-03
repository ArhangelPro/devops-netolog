variable "resource" {
  type = map(string)
  default = {
    vm_web_name = "netology-develop-platform-web"
    vm_web_platform_id = "standard-v1"
    vm_db_name = "netology-develop-platform-db"
    vm_db_platform_id = "standard-v1"
  }
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    "vm_web" = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    "vm_db" = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}
