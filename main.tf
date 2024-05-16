terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url         = "https://192.168.254.153:8006/api2/json"
  pm_api_token_id    = "terraform@pam!terraform"
  pm_api_token_secret = "c467d123-6860-4936-9c17-66fdb00ae41a"
  pm_tls_insecure    = true
}

resource "proxmox_vm_qemu" "test_server" {
  count = 1

  name        = "jenkins-vm-${count.index + 1}"
  target_node = var.proxmox_host
  clone       = var.template_name
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot    = 0
    size    = "20G"
    type    = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "debian"
      host        = "192.168.254.252"
      private_key = file("~/.ssh/id_rsa")
      port        = 22
    }
    inline = [
      "wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo apt-key add -",
      "sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "sudo apt-get update",
      "sudo apt-get install -y openjdk-11-jdk",
      "sudo apt-get install -y jenkins"
    ]
  }
}