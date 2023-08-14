###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###yandex_compute_image vars
variable "family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}

variable "security_group_ids" {
  type        = string
  description = "https://cloud.yandex.ru/docs/vpc/operations/security-group-create"
}

variable "vms_resources" {
  type = list(object({ 
    vm_name=string, 
    cpu=number, 
    ram=number, 
    disk=number,
    core_fraction=number}))
    default = [
      {
      vm_name = "main"
      cpu     = 2
      ram     = 1
      disk    = 30
      core_fraction = 5
    },
    {
      vm_name = "replica"
      cpu     = 4
      ram     = 2
      disk    = 40
      core_fraction = 5
    }
    ]
}

variable "hosts_ansible" {
  type = list(map(string))
  default     = [
  {
    group_name = "webservers"
      instance =  "yandex_compute_instance.web"},
    {
    group_name = "databases"
      instance =  "yandex_compute_instance.databases"},
    {
    group_name = "storage"
      instance =  "yandex_compute_instance.storage"
  }
 ]
}
