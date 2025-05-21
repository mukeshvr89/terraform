variable "rg_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the resource group will be created."
}

variable "environment" {
  type        = string
  description = "The environment tag for the resources."
}
variable "owner" {
  type        = string
  description = "The owner tag for the resources."
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the virtual network."    
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes for the subnet."
}

variable "public_ip_name" {
    type        = string
    description = "The name of the public IP address."      
}

variable "nic_name" {
  type = string
    description = "The name of the network interface."
}

variable "vm_name" {
  type = string
  description = "The name of the virtual machine."
}

variable "sku" {    
    type        = string
    description = "The SKU of the virtual machine." 
}

variable "admin_username" {
  type        = string
  description = "The admin username for the virtual machine."   
}

variable "nsg_name" {
  type        = string
  description = "The name of the network security group."   
}