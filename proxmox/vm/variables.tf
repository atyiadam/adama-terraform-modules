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

variable "clone_node_name" {
  description = " The name of the source node (leave blank, if equal to the node_name argument)"
  type        = string
}

variable "cpu" {
  description = "Number of CPU cores"
  type        = string
}

variable "cpu_type" {
  description = "Type of CPU"
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

variable "dns_domain" {
  description = "The DNS search domain"
  type        = string
}

variable "dns_servers" {
  description = "The list of DNS servers"
  type        = list(string)
}

variable "dns_a_record" {
  description = "Decide to create a DNS A record or not"
  type        = bool
}

