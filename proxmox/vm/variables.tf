variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_node" {
  description = "Proxmox Node Name"
  type        = string
}

variable "clone_vm_id" {
  description = "ID of the VM template to be cloned"
  type        = string
}

variable "cpu" {
  description = "Number of CPU cores"
  type        = string
}

variable "memory" {
  description = "Memory size"
  type        = string
}

variable "ipv4_address" {
  description = "Static IPv4 address"
  type        = string
}

variable "ipv4_gw" {
  description = "IPv4 gateway address"
  type        = string
}
