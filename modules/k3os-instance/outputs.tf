# vim: tabstop=2 shiftwidth=2 expandtab

output "hostname" {
  value       = libvirt_domain.k3os_instance.name
  description = ""
}