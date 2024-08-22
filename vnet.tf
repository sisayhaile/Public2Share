###########################################################################################
# Azure Terraform Sisay Stash commands
# Sisay - @sisayhaile@github
#Date 09/12.2023
#Script Purpose
# Deploying multiple Vnet in Hub and Spoke topology with peering in multiple Region
###########################################################################################
####--------------------####
####   Creating VNET    ####
#### -------------------####
###########################################################################################
######################  Createing hub vnet with loops in two region   ############################
###########################################################################################
module "hub_vnet" {
  source              = "..//..//azure-tf-network-modules-master/vnet"
  for_each            = var.hub
  vnet_name           = "vnet-${each.value.topology}-${each.value.location}"
  resource_group_name = "${each.value.vnet_rg}-${each.value.location}"
  location            = each.value.location
  address_space       = [each.value.address_space]
  # dns_servers                 = ["${each.value.cidr_block1}.2.4"]
  subnet_names    = [each.value.subnet.name01, each.value.subnet.name02, each.value.subnet.name03, each.value.subnet.name04, each.value.subnet.name05, each.value.subnet.name06, each.value.subnet.name07, each.value.subnet.name08, each.value.subnet.name09, each.value.subnet.name10, each.value.subnet.name11]
  subnet_prefixes = [each.value.subnet.cidr01, each.value.subnet.cidr02, each.value.subnet.cidr03, each.value.subnet.cidr04, each.value.subnet.cidr05, each.value.subnet.cidr06, each.value.subnet.cidr07, each.value.subnet.cidr08, each.value.subnet.cidr09, each.value.subnet.cidr10, each.value.subnet.cidr11]
  providers = {
    azurerm.sub = azurerm.mac-lab-sub-07-it
  }
  tags = var.tags
}
/*
    #----------------------------------------------------------------
    # Virtual Networks and Subnets Spoke Envirnoment
    # ---------------------------------------------------------------
      module "vnet_spoke1_eastus2" {
        source              = "..//..//azure-tf-network-modules-master/vnet"
        vnet_name           = "vnet-spoke1-${var.location1}"
        resource_group_name = data.azurerm_resource_group.rg-eastus2.name
        location            = data.azurerm_resource_group.rg-eastus2.location
        address_space       = ["${var.cidr_block1}.8.0/22"]
        # dns_servers                 = ["${var.location1.cidr_block1}.2.4"]
        subnet_prefixes = ["${var.cidr_block1}.8.0/27", "${var.cidr_block1}.8.32/27", "${var.cidr_block1}.8.64/27", "${var.cidr_block1}.8.96/27", "${var.cidr_block1}.8.128/27", "${var.cidr_block1}.8.160/27", "${var.cidr_block1}.8.192/27", "${var.cidr_block1}.8.240/29"]
        subnet_names    = ["subnet-spoke1-web-${var.location1}", "subnet-spoke1-app-${var.location1}", "subnet-spoke1-db-${var.location1}", "subnet-spoke1-lb-${var.location1}", "subnet-spoke1-agw-${var.location1}", "subnet-spoke1-dmz-${var.location1}", "AzureBastionSubnet", "subnet-spoke1-test-${var.location1}"]
        providers = {
          azurerm.sub = azurerm.mac-lab-sub-07-it
        }
        tags = var.tags
      }

  ###############################################################################################
  ####  VNET Peering in the same and across Region for  Hub and Spoke Vnet   ####################
  ###############################################################################################

####------------------####
####   Peering        ####
#### -----------------####

  #----------------------------------------------------------------
  #eastus2 Hub Peering
  #----------------------------------------------------------------
    resource "azurerm_virtual_network_peering" "eastus2_hub_peering-to-spoke1" {
      name                         = "peer-${module.vnet_hub_eastus2.vnet_name}-to-${module.vnet_spoke1_eastus2.vnet_name}"
      resource_group_name          = module.vnet_hub_eastus2.vnet_rg
      virtual_network_name         = module.vnet_hub_eastus2.vnet_name
      remote_virtual_network_id    = module.vnet_spoke1_eastus2.vnet_id
      allow_virtual_network_access = var.allow_virtual_network_access
      allow_forwarded_traffic      = var.allow_forwarded_traffic
      allow_gateway_transit        = var.allow_gateway_transit
      use_remote_gateways          = var.use_remote_gateways
      provider                     = azurerm.mac-lab-sub-07-it
      depends_on = [
        module.vnet_hub_eastus2, module.vnet_spoke1_eastus2
      ]
    }
   */