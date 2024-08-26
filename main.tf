# Generate random resource group name 
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

data "azurerm_role_definition" "example" {
  name = "Contributor"
}

resource "azurerm_role_assignment" "example" {
  scope              = azurerm_kubernetes_cluster.k8s.id
  role_definition_id = data.azurerm_role_definition.example.id
  principal_id       = "62c87dff-9a4f-4d13-9ca3-da229ed0fc81"
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

resource "random_pet" "azurerm_kubernetes_cluster_name" {
  prefix = "cluster"
}

resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.resource_group_location
  name                = random_pet.azurerm_kubernetes_cluster_name.id
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

#service_principal {
# client_id     = var.client_id
# client_secret = var.client_secret
#}

identity {
    type = "SystemAssigned"
  }

default_node_pool {
  name       = "agentpool"
  vm_size    = "Standard_D2_v2"
  node_count = var.node_count
}

linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
    }
  }
  
network_profile {
  network_plugin    = "kubenet"
  load_balancer_sku = "standard"
  }
}
