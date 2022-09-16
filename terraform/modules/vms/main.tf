# Create public IPs
resource "azurerm_public_ip" "publicip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  allocation_method   = "Static"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "VON-Web"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = var.vms_default_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.241.0.10"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vm_size

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "22.04.202207121"
  }

  computer_name                   = var.computer_name
  admin_username                  = var.username
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.username
    public_key = file(var.ssh_public_key)
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = azurerm_public_ip.publicip.ip_address
      type        = "ssh"
      user        = var.username
      private_key = file(var.ssh_private_key)
    }
  }

  provisioner "local-exec" {
    command = "ansible-galaxy install -r requirements.yml"
  }

  provisioner "local-exec" {
    command = "chmod 0600 /data/builds/kubernetes-deploy/5g-zorro.tmp/TF_VAR_ssh_private_key"
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ${var.username} -i '${azurerm_public_ip.publicip.ip_address},' --private-key ${var.ssh_private_key} -e 'pub_key=${var.ssh_public_key}' ${var.ansible_script}"
  }
}
