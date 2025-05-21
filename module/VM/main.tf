
locals {
  tags = {
    environment = var.environment
    owner       = var.owner
  }
}

resource "azurerm_resource_group" "myvm" {
  name = var.rg_name
  location = var.location
}
resource "azurerm_virtual_network" "myvnet" {
  name                = "${var.rg_name}-vnet"
  address_space       = var.address_space
    location           = var.location   
    resource_group_name = var.rg_name
    tags               = local.tags
}

resource "azurerm_subnet" "mysubnet" {
  name                 = "${var.rg_name}-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.address_prefixes
}


resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = local.tags
}

resource "azurerm_network_interface" "example" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = local.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.sku
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "var.admin_username"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  tags = local.tags
}


resource "azurerm_network_security_group" "vm_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

 tags = local.tags
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
    depends_on = [azurerm_network_interface.example]
}