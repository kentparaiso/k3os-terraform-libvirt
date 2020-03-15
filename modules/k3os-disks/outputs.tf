# vim: tabstop=2 shiftwidth=2 expandtab

output "kernel_volume_id" {
  value       = libvirt_volume.k3os_kernel.id
  description = ""
}

output "initrd_volume_id" {
  value       = libvirt_volume.k3os_initrd.id
  description = ""
}

output "iso_volume_id" {
  value       = libvirt_volume.k3os_iso.id
  description = ""
}