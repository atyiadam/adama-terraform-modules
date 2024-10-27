resource "proxmox_virtual_environment_vm" "vm" {

  name      = var.vm_name
  node_name = var.vm_node

  clone {
    vm_id = var.clone_vm_id
  }

  cpu {
    cores = var.cpu
  }

  memory {
    dedicated = var.memory
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gw
      }
    }

    dns {
      domain  = var.dns_domain
      servers = var.dns_servers
    }
  }

  lifecycle {
    ignore_changes = [
      network_device,
      vga
    ]
  }

}

resource "powerdns_record" "record-a" {
  zone    = var.dns_domain
  name    = "ns1.${var.dns_domain}"
  type    = "A"
  ttl     = 300
  records = [var.ipv4_address]
}
