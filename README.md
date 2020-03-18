# k3os-terraform-libvirt

This terraform module helps me set-up my home Kubernetes lab based on [Rancher's k3os](https://github.com/rancher/k3os)

## Prerequisites

- A working libvirt and qemu stack.
- A dynamic DNS setup for the libvirt stack. Similar to this
  [excellent guide](https://fabianlee.org/2018/10/22/kvm-using-dnsmasq-for-libvirt-dns-resolution/).
- terraform >= 0.12
- [terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)

## Miscellaneous

Your libvirt's [access control](https://libvirt.org/aclpolkit.html) might prompt you for a password everytime you
fire up a build. You might want to follow the directions mentioned [here](https://www.poftut.com/use-virt-manager-libvirt-normal-user-without-root-privileges-without-asking-password/).

## Quickstart

1. Download ```k3os-vmlinuz-amd64```, ```k3os-initrd-amd64```, and
   ```k3os-amd64.iso``` from the [k3os releases](https://github.com/rancher/k3os/releases)
   page, place those images in ```./template/images```.
2. cd to ```./template```.
3. Customize ```main.tf``` according to your requirements. Set ```ssh_authorized_keys```
   to your SSH public key! *It's a list, so you can set multiple public keys.*
4. Execute ```terraform plan```.
5. If you like what you see. Run ```terraform apply```.

## How it (roughly) works

1.  Terraform tells libvirt to create a directory-based storage pool.
2.  Populate the said storage pool with a common copy of the kernel and initrd, and
    N number of copies of ```k3os-amd64.iso``` as ```${hostname}-install.iso```.
3.  Create a ```${hostname}-cloudinit.iso``` for each domain in the storage pool, with
    the rendered contents of ```./modules/k3os-instance/userdata/config_yml.tpl``` as
    ```user-data.txt``` in the root of the ```cloudinit.iso``` filesystem.
4.  Create a 4GB (by default) disk named ```${hostname}-state.qcow2``` for each domain.
5.  It will also tell libvirt to create qemu domain(s) and attach the initrd and kernel
    to them as direct boot, and attaches ```${hostname}-cloudinit.iso``` and
    ```${hostname}-state.qcow2``` as well.
6.  It'll then tell libvirt to power-on the domain(s). At this point, terraform's work is done.
7.  The domains(s) will boot off their own copy of ```${hostname}-install.iso```.
8.  K3os installation routine finds the ```/dev/vda``` state disk blank, formats it, and
    installs K3os.
9.  K3os's installation routine finishes, reboots the domain.
10. The domain(s) boots off from their respective state disk.
11. The agents find the servers' URL, and uses the token (```k3os``` by default) to join
    the k3s server, forming a cluster.

## License

- Apache 2.0, See LICENSE file.

**NOT FOR PRODUCTION USE**