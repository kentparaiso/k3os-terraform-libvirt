# vim: tabstop=2 shiftwidth=2 expandtab

terraform {
  required_version = ">=0.12"
}

resource "libvirt_pool" "storage_pool" {
  name = var.storage_pool_name
  type = "dir"
  path = "${var.storage_pool_base_path}/${var.storage_pool_name}"
}