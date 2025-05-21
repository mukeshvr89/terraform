output "azurerm_resource_group" {
  value = azurerm_resource_group.myvm.name
}

output "azurerm_virtual_network" {
  value = azurerm_virtual_network.myvnet.address_space
}

output "azurerm_subnet" {
  value = azurerm_subnet.mysubnet.address_prefixes  
}

output "azurerm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "azurerm_linux_virtual_machine" {
  value = azurerm_linux_virtual_machine.example.name  
  
}
output "nsg_name" {
  value = azurerm_network_security_group.vm_nsg.name
}