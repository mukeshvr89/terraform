module "VM" {
  source = "./module/VM"

  rg_name          = var.rg_name
  location         = var.location
  environment      = var.environment
  owner            = var.owner
  address_space    = var.address_space
  address_prefixes = var.address_prefixes
  public_ip_name   = var.public_ip_name
  nic_name         = var.nic_name
  vm_name          = var.vm_name
  sku              = var.sku
  admin_username   = var.admin_username
  nsg_name         = var.nsg_name
}