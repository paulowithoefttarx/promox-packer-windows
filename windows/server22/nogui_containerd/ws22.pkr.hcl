packer {
  required_version = ">= 1.9.1"
  required_plugins {
    proxmox = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/proxmox"
    }
    windows-update = {
      version = ">= 0.14.3"
      source = "github.com/rgl/windows-update"
    }
  }
}

source "proxmox-iso" "wsservergui22" {
  node                     = var.node
  password                 = var.password
  username                 = var.username
  proxmox_url              = var.proxmox_url
  insecure_skip_tls_verify = true
  os                       = "win11"
  sockets                  = "1"
  cores                    = "2"
  memory                   = "8196"
  qemu_agent               = true
  scsi_controller          = "lsi"
  disks {
    disk_size         = "60G"
    storage_pool      = "local-lvm"
    #storage_pool_type = "lvm"
    type              = "sata"
  }
  boot                    = "order=ide2;sata5;virtio0"
  boot_command            = ["<wait1m>"]
  boot_wait               = "10m"
  iso_checksum            = "md5:064b69d7e35689acf518fa8f80269dad"
  iso_storage_pool        = "local"
  iso_url                 = "https://software-static.download.prss.microsoft.com/sg/download/888969d5-f34g-4e03-ac9d-1f9786c66749/SERVER_EVAL_x64FRE_en-us.iso"
  #iso_file                = "local:iso/SERVER_EVAL_x64FRE_en-us.iso"
  unmount_iso             = true
  cloud_init              = true
  cloud_init_storage_pool = "local-lvm"
  additional_iso_files {
    device   = "sata5"
    iso_file = "local:iso/templatewsgui22.iso"
    unmount  = true
  }
  network_adapters {
    bridge = "vmbr0"
    model  = "e1000"
  }
  communicator         = "winrm"
  winrm_username       = var.local_admin
  winrm_password       = var.local_pass
  winrm_insecure       = true
  winrm_use_ntlm       = true
  winrm_use_ssl        = true
  winrm_timeout        = "1h"
  template_description = "WindowsServer22Gui"
  template_name        = "templatewsgui22"
}

build {
  sources = ["source.proxmox-iso.wsservergui22"]

  provisioner "windows-restart" {}

  provisioner "windows-update" {
    pause_before  = "1m"
    search_criteria = "IsInstalled=0"
    filters = [
      "exclude:$_.Title -like '*Preview*'",
      "include:$true",
    ]
    update_limit = 30
  }

  provisioner "windows-shell" {
    pause_before  = "30s"
  inline = [
    "C:\\Windows\\System32\\Sysprep\\sysprep.exe /generalize /oobe /shutdown /quiet /unattend:E:\\unattend.xml"
  ]
}

}

