# k3os-terraform-libvirt

This terraform module helps me set up my home Kubernetes lab based on [Rancher's k3os](https://github.com/rancher/k3os)

## Prerequisites

- A working libvirt and qemu stack
- terraform >= 0.12
- [terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)

## Miscellaneous

Your libvirt's [access control](https://libvirt.org/aclpolkit.html) might prompt you for a password everytime you
fire up a build. You might want to follow the directions mentioned [here](https://www.poftut.com/use-virt-manager-libvirt-normal-user-without-root-privileges-without-asking-password/).

## Quickstart

1. Download k3os-vmlinuz-amd64, k3os-initrd-amd64, and k3os-amd64.iso, place those images in ./template/images
2. cd to ```./template```
3. Customize ```main.tf``` according to your requirements.
4. Execute ```terraform plan```
5. If you like what you see. Run ```terraform apply```.
