# vim: tabstop=2 shiftwidth=2 expandtab

variable "k3os_kernel_source" {
  type        = string
  default     = "https://github.com/rancher/k3os/releases/download/v0.9.1/k3os-vmlinuz-amd64"
  description = ""
}

variable "k3os_initrd_source" {
  type        = string
  default     = "https://github.com/rancher/k3os/releases/download/v0.9.1/k3os-initrd-amd64"
  description = ""
}

variable "k3os_iso_source" {
  type        = string
  default     = "https://github.com/rancher/k3os/releases/download/v0.9.1/k3os-amd64.iso"
  description = ""
}

variable "storage_pool_name" {
  type        = string
  description = ""
}

variable "unique_id" {
  type        = string
  description = ""
}