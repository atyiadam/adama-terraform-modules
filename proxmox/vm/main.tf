resource "proxmox_virtual_environment_vm" "vm" {

  name      = trimsuffix("${var.vm_name}.${var.dns_domain}", ".")
  node_name = var.vm_node

  clone {
    vm_id = var.clone_vm_id
    node_name = var.clone_node_name
  }

  cpu {
    cores = var.cpu
    type  = var.cpu_type
  }

  agent {
    enabled = true
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
      node_name,
      network_device,
      vga
    ]
  }

}

resource "powerdns_record" "record-a" {
  count   = var.dns_a_record ? 1 : 0
  zone    = var.dns_domain
  name    = "${var.vm_name}.${var.dns_domain}"
  type    = "A"
  ttl     = 300
  records = [regex("^([^/]+)", var.ipv4_address)[0]]
}
