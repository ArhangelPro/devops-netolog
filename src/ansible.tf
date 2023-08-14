# resource "local_file" "hosts_cfg" {
#   for_each = local.hosts_ansible_key
#   content  = templatefile("${path.module}/hosts.tftpl", { "server" = "${each.value}"})

#   filename = "${abspath(path.module)}/hosts.cfg"
# }

resource "local_file" "hosts_cfg" {
  content  = templatefile("${path.module}/hosts.tftpl", {
    
    webservers =  yandex_compute_instance.web,
    databases  =  yandex_compute_instance.databases,
    storages   =  yandex_compute_instance.storage
    }
  )

  filename = "${abspath(path.module)}/hosts.cfg"
}
