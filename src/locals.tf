locals {
    ssh_file = file("~/./.ssh/id_ed25519.pub")
    ssh_key = "ubuntu:${local.ssh_file}"
    secondary_disk = [yandex_compute_disk.empty-disk[0], 
    yandex_compute_disk.empty-disk[1], 
    yandex_compute_disk.empty-disk[2]]
}

    #
# Попытка единого шаблона
#     instance = [yandex_compute_instance.web, 
#     yandex_compute_instance.databases, 
#     yandex_compute_instance.storage] 

#     hosts_ansible = [
#   {
#     group_name = "webservers"
#       instance =  [local.instance[0]]},
#     {
#     group_name = "databases"
#       instance =  [local.instance[1]]},
#     {
#     group_name = "storage"
#       instance =  [local.instance[2]]
#   }
#  ]

# group_instances = [ for item in local.hosts_ansible : 
# setproduct([item.group_name], item.instance)
# ]

# group_instances_map = [ for item in local.hosts_ansible : [
#     for i in setproduct([item.group_name], item.instance) : {
#     group_name = i[0]
#     instance = i[1]}

#     ]
# ]
# hosts_flat = flatten(local.group_instances_map)

# hosts_ansible_key = { for item in local.hosts_flat : "${item.group_name}" => item}
