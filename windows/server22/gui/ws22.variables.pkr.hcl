variable "proxmox_url" {
  type    = string
  default = ""
}

variable "username" {
  type    = string
  default = ""
}

variable "node" {
  type    = string
  default = ""
}

variable "password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "local_admin" {
  type    = string
  default = ""
}

variable "local_pass" {
  type      = string
  default   = ""
  sensitive = true
}
