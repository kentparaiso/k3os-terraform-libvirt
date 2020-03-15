# vim: tabstop=2 shiftwidth=2 expandtab

output "pool_name" {
  value       = libvirt_pool.storage_pool.name
  description = ""
}