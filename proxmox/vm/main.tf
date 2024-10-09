terraform {

  required_version = "1.9.6"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.1"
    }
  }

}

provider "proxmox" {

  endpoint  = var.pm_api_url
  api_token = "${var.pm_api_token_id}=${var.pm_api_token_secret}"
  insecure  = true

}

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

}

