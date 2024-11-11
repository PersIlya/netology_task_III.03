variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "YaCloud" {
  description = "YaCloud options"
  type = object({cloud_id=string, folder_id=string, default_zone=string, default_cidr = list(string)})
  sensitive = true
}


variable "vms_resources" {
  description = "Global VMs resources"
  type = object(
    {
      cpu = number
      ram = number
      fract = number
      disk_type = string
      disk_size = number
    }
  )
  default = { cpu = 2, ram = 2, fract = 20, disk_type = "network-hdd", disk_size = 12  }
} 

variable vms_name{ type=list }
