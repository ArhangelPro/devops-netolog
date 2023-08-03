locals {
web = "netology-${ var.vms_resources["vm_web"]["memory"]}"
db = "netology-${ var.vms_resources["vm_db"]["memory"] }"
meta = ["ubuntu:${var.vms_ssh_root_key}", "1"]
}
