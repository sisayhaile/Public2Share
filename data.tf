data "azurerm_resource_group" "rg-eastus2" {
  provider = azurerm.mac-lab-sub-07-it
  name     = var.rg1
}
data "azurerm_resource_group" "rg-centralus" {
  provider = azurerm.mac-lab-sub-07-it
  name     = var.rg2
}