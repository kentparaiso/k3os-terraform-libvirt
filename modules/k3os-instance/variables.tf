variable "ssh_authorized_keys" {
  type    = list
  default = ["github:kentparaiso"]
}

variable "role" {
  type    = string
  default = "server"
}

variable "rancher_password" {
  type        = string
  default     = "rancher"
  description = "The 'rancher' user password."
}

variable "token" {
  type        = string
  default     = "k3os"
  description = ""
}

variable "hostname" {
  type        = string
  default     = "k3os-boot-test"
  description = ""
}

variable "k3s_agent_args" {
  type        = list
  default     = ["agent"]
  description = ""
}

variable "k3s_agent_additional_args" {
  type        = list
  default     = []
  description = ""
}

variable "k3s_server_args" {
  type        = list
  default     = ["server"]
  description = ""
}

variable "k3s_server_additional_args" {
  type        = list
  default     = []
  description = ""
}

variable "modules" {
  type        = list
  default     = []
  description = ""
}

variable "data_sources" {
  type        = list
  default = []
  # default     = [
  #   "aws",
  #   "cdrom"
  # ]
  description = ""
}

variable "dns_nameservers" {
  type        = list
  default     = []
  description = ""
}

variable "ntp_servers" {
  type        = list
  default     = []
  description = ""
}

variable "taints" {
  type        = list
  default = []
  # default     = [
  #   "key1=value1:NoSchedule",
  #   "key1=value1:NoExecute",
  # ]
  description = ""
}

variable "sysctl" {
  type        = map
  default = {}
  # default     = {
  #   "kernel.printk" = "4 4 1 7",
  #   "kernel.kptr_restrict" = "1"
  # }
  description = ""
}

variable "environment" {
  type        = map
  default = {}
  # default     = {
  #   "http_proxy" = "https://myserver",
  #   "https_proxy" = "https://myserver"
  # }
  description = ""
}

variable "labels" {
  type        = map
  default = {}
  # default     = {
  #   "region" = "eu-west-1",
  #   "somekey" = "somevalue"
  # }
  description = ""
}

variable "server_url" {
  type        = string
  default     = ""
  description = ""
}

variable "wifi" {
  type        = list
  default = []
  # default     = [
  #   {
  #     "name": "soundwave",
  #     "passphrase": "pwet"
  #   }
  # ]
  description = ""
}

variable "storage_pool_name" {
  type        = string
  description = ""
}

variable "autostart" {
  type        = bool
  default     = true
  description = ""
}

variable "memory" {
  type        = string
  default     = "4096"
  description = ""
}

variable "vcpu" {
  type        = number
  default     = 2
  description = ""
}
