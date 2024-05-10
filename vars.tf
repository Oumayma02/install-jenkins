variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvuG+3CmvfG530gwAAtxNBL9wAZsaXgMDkV600LkfItlDNQlgRFMLPz4Mw4EIUK85OTNyKa9G79AlkN/Cl6xmx5a3aTAejw36ebR2vGcUfdbUkqBUpOV1YDpn5pppLF6IxlNAlP52LakS/YpXkx6u+Epj8s0X1hd65f4MtXgSroZqW2n/AJr75DzlthO7caiiIsdBOv/0smsvXFldyBGwsJPN9p1SfVaGtDLZcuT5SsM4foW2YipS8v3QeCL0htsEI3hr8EQK745U7O8xyvB6nIxIDJ/CT+2IHy48rc9gojX+gXcfgVHQdA/XSnk7UFSLbYm0feBWBXs0+Wdrznd//L8m5nGFho2I/dSkA825pNQMQRQ14fRszkEuGEJ7sf/GS6pc8FVszHm2hz08LqGnrWMGsIEicBvCDwp+Lca0ChFqf6L5Dqi627Wn9A0aYazV5jH1GrlUiqzzoa3K9jN4RHVZ32RYMastK7vmOzq8DkoSGS2KovHM3yuToUg4lDl0= debian@ubuntu-cloudd"
}
variable "proxmox_host" {
    default = "pve"
}
variable "template_name" {
    default = "ubuntu-cloud"
}