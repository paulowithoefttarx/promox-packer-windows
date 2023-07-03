packer {
  required_version = ">= 1.8.4"
  required_plugins {
    proxmox = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

variable "disk_type" {
  type    = string
  default = ""
}

variable "os" {
  type    = string
  default = ""
}

variable "ip" {
  type    = string
  default = ""
}

variable "scsi_controller" {
  type    = string
  default = ""
}

variable "memory" {
  type    = string
  default = ""
}

variable "disk_storage_pool" {
  type    = string
  default = ""
}

variable "sockets" {
  type    = string
  default = ""
}

variable "port" {
  type    = string
  default = ""
}

variable "disk_size" {
  type    = string
  default = ""
}

variable "disk_storage_pool_type" {
  type    = string
  default = ""
}

variable "username" {
  type    = string
  default = ""
}

variable "iso_storage_pool" {
  type    = string
  default = ""
}

variable "network_adapters_model" {
  type    = string
  default = ""
}

variable "network_adapters_bridge" {
  type    = string
  default = ""
}

variable "cores" {
  type    = string
  default = ""
}

variable "node" {
  type    = string
  default = ""
}

variable "cloud_init_storage_pool" {
  type    = string
  default = ""
}

variable "password" {
  type      = string
  default   = ""
  sensitive = true
}


