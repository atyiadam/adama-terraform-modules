resource "proxmox_virtual_environment_vm" "test_vm" {


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
  }

  lifecycle {
    ignore_changes = [
      network_device,
      vga
    ]
  }

}

