# vim: tabstop=2 shiftwidth=2 expandtab

terraform {
  required_version = ">=0.12"
}

resource "libvirt_volume" "k3os_kernel" {
  source = fileexists("${path.root}/images/k3os-vmlinuz-amd64") ? "${path.root}/images/k3os-vmlinuz-amd64" : var.k3os_kernel_source
  name   = "${var.unique_id}-vmlinuz-amd64"
  pool   = var.storage_pool_name
  format = "raw"
}

resource "libvirt_volume" "k3os_initrd" {
  source = fileexists("${path.root}/images/k3os-initrd-amd64") ? "${path.root}/images/k3os-initrd-amd64" : var.k3os_initrd_source
  name   = "${var.unique_id}-initrd-amd64"
  pool   = var.storage_pool_name
  format = "raw"
}

resource "libvirt_volume" "k3os_iso" {
  source = fileexists("${path.root}/images/k3os-amd64.iso") ? "${path.root}/images/k3os-amd64.iso" : var.k3os_iso_source
  name   = "${var.unique_id}-install.iso"
  pool   = var.storage_pool_name
  format = "raw"
}