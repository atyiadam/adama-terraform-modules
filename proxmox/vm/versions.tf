terraform {
  required_version = ">= 1.9.6"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.66.1"
    }
  }
}
