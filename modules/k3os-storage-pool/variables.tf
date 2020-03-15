# vim: tabstop=2 shiftwidth=2 expandtab

variable "storage_pool_name" {
  type        = string
  description = ""
}

variable "storage_pool_base_path" {
  type        = string
  default     = "/var/lib/libvirt/images"
  description = ""
}