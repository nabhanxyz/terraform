resource "proxmox_vm_qemu" "k3c0" {

  name        = "k3c0"
  desc        = "k3c0"
  target_node = "lab1"

  clone = "ubuntu-20.04-cloudimg"
  agent = "1"

  cores  = 1
  memory = 2048

  os_type = "cloud-init"
  network {
    bridge   = "vmbr0"
    firewall = "false"
    model    = "virtio"
    # tag      = 70
  }

  disk {
    type    = "scsi"
    storage = "nvme"
    size    = "32G"
  }

  ipconfig0               = "ip=dhcp"
  ciuser                  = "ansible"
  cipassword              = var.xyzrandom_pass
  nameserver              = "8.8.8.8,9.9.9.9,1.0.0.1"
  cloudinit_cdrom_storage = "local-lvm"
  sshkeys                 = data.http.keys.body

  lifecycle {
    ignore_changes = [
      sshkeys,
      cipassword
    ]
  }
}

resource "cloudflare_record" "k3c0" {
  zone_id = var.xyzcloudflare_zone_id
  name    = proxmox_vm_qemu.k3c0.name
  value   = proxmox_vm_qemu.k3c0.default_ipv4_address
  type    = "A"
  ttl     = 60
  proxied = false
}