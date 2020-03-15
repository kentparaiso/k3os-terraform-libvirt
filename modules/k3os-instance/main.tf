# vim: tabstop=2 shiftwidth=2 expandtab

terraform {
  required_version = ">=0.12"
}

module "k3os_disks" {
  source = "../k3os-disks"
  storage_pool_name = var.storage_pool_name
  unique_id = var.hostname
}

resource "libvirt_cloudinit_disk" "cloud_init" {
  name = "${var.hostname}-cloudinit.iso"
  pool = var.storage_pool_name
  user_data = templatefile("${path.module}/userdata/config_yml.tpl", {
    data_sources        = var.data_sources
    dns_nameservers     = var.dns_nameservers,
    environment         = var.environment,
    hostname            = var.hostname,
    k3s_args            = "${var.role == "agent" ? concat(var.k3s_agent_args, var.k3s_agent_additional_args) : concat(var.k3s_server_args, var.k3s_server_additional_args)}",
    labels              = var.labels,
    modules             = var.modules,
    ntp_servers         = var.ntp_servers,
    rancher_password    = var.rancher_password,
    role                = var.role,
    server_url          = var.server_url,
    ssh_authorized_keys = var.ssh_authorized_keys,
    sysctl              = var.sysctl,
    taints              = var.taints,
    token               = var.token,
    wifi                = var.wifi,
  })
}

resource "libvirt_volume" "k3os_state_disk" {
  name   = "${var.hostname}-state.qcow2"
  pool   = var.storage_pool_name
  size   = var.state_disk_size
  format = "qcow2"
}

resource "libvirt_domain" "k3os_instance" {
  name   = var.hostname
  memory = var.memory
  vcpu   = var.vcpu

  autostart = var.autostart

  kernel    = module.k3os_disks.kernel_volume_id
  initrd    = module.k3os_disks.initrd_volume_id
  cloudinit = libvirt_cloudinit_disk.cloud_init.id

  cmdline = [
    {
      _ = join(" ", [
        "k3os.fallback_mode=install",
        "k3os.install.silent=true",
        "k3os.install.device=/dev/vda",
        "run_cmd=\"mkdir -p /mnt/cloud-init && mount /dev/sr0 /mnt/cloud-init\"",
        "k3os.install.config_url=/mnt/cloud-init/user-data"
      ])
    }
  ]

  disk {
    volume_id = libvirt_volume.k3os_state_disk.id
  }

  disk {
    volume_id = module.k3os_disks.iso_volume_id
  }

  network_interface {
    network_name = "default"
  }

  graphics {
    type           = "spice"
    listen_address = "address"
    autoport       = true
  }

  running = true
}
