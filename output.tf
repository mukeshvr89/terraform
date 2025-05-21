output "azurerm_resource_group" {
  value = module.VM.azurerm_resource_group
}

output "azurerm_virtual_network" {
  value = module.VM.azurerm_virtual_network
}

output "azurerm_subnet" {
  value = module.VM.azurerm_subnet  
}

output "azurerm_public_ip" {
  value = module.VM.azurerm_public_ip
}

output "azurerm_linux_virtual_machine" {
  value = module.VM.azurerm_linux_virtual_machine
  
}
output "nsg_name" {
  value = module.VM.nsg_name
}