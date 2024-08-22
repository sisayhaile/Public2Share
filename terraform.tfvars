hub = [
  vne-hub-eastus2 = [
    {
    vnet_rg = "rg-neteng-poc"
    topology = "hub"
    gateway_name = "vnet-hub"
    location = "centralus"
    address_space = "100.106.0.0/22"
      subnet = [
        { cidr = "100.106.0.0/26", name = "subnet-mgmt" },
        { cidr = "100.106.0.64/26", name = "subnet-internet" },
        { cidr = "100.106.0.128/26", name = "subnet-dmz" },
        { cidr = "100.106.0.196/26", name = "subnet-reserve1" },
        { cidr = "100.106.1.0/25", name = "subnet-inside" },
        { cidr = "100.106.1.128/25", name = "subnet-reserve2" },
        { cidr = "100.106.2.0/27", name = "subnet-diag" },
        { cidr = "100.106.2.32/27", name = "subnet-route-verify" },
        { cidr = "100.106.2.64/27", name = "RouteServerSubnet" },
        { cidr = "100.106.2.96/27", name = "AzureBastionSubnet" },
        { cidr = "100.106.3.128/27", name = "GatewaySubnet" }
      ]
    }
   ]
  vnet-hub-centralus = [
    {
    vnet_rg = "rg-neteng-poc"
    topology = "hub"
    gateway_name = "vnet-hub"
    location = "centralus"
    address_space = "100.106.0.0/22"
      subnet = [
        { cidr = "100.106.0.0/26", name = "subnet-mgmt" },
        { cidr = "100.106.0.64/26", name = "subnet-internet" },
        { cidr = "100.106.0.128/26", name = "subnet-dmz" },
        { cidr = "100.106.0.196/26", name = "subnet-reserve1" },
        { cidr = "100.106.1.0/25", name = "subnet-inside" },
        { cidr = "100.106.1.128/25", name = "subnet-reserve2" },
        { cidr = "100.106.2.0/27", name = "subnet-diag" },
        { cidr = "100.106.2.32/27", name = "subnet-route-verify" },
        { cidr = "100.106.2.64/27", name = "RouteServerSubnet" },
        { cidr = "100.106.2.96/27", name = "AzureBastionSubnet" },
        { cidr = "100.106.3.128/27", name = "GatewaySubnet" }
      ]
    }
  ]
]


/*

hub = {
  "vne-hub-eastus2" = {
    vnet_rg       = "rg-neteng-poc"
    topology      = "hub"
    vnet_name     = "vnet-hub"
    location      = "eastus2"
    address_space = "100.104.0.0/22"
    subnet = {
      "cidr01" = { cidr = "100.104.0.0/26" }, "name01" = { name = "subnet-mgmt" },
      "cidr02" = { cidr = "100.104.0.64/26" }, "name02" = { name = "subnet-internet" },
      "cidr03" = { cidr = "100.104.0.128/26" }, "name03" = { name = "subnet-dmz" },
      "cidr04" = { cidr = "100.104.0.196/26" }, "name04" = { name = "subnet-reserve1" },
      "cidr05" = { cidr = "100.104.1.0/25" }, "name05" = { name = "subnet-inside" },
      "cidr06" = { cidr = "100.104.1.128/25" }, "name06" = { name = "subnet-reserve2" },
      "cidr07" = { cidr = "100.104.2.0/27" }, "name07" = { name = "subnet-diag" },
      "cidr08" = { cidr = "100.104.2.32/27" }, "name08" = { name = "subnet-route-verify" },
      "cidr09" = { cidr = "100.104.2.64/27" }, "name09" = { name = "RouteServerSubnet" },
      "cidr10" = { cidr = "100.104.2.96/27" }, "name10" = { name = "AzureBastionSubnet" },
      "cidr11" = { cidr = "100.104.3.128/27" }, "name11" = { name = "GatewaySubnet" }
    }
  }
  "vnet-hub-centralus" = {
    vnet_rg       = "rg-neteng-poc"
    topology      = "hub"
    gateway_name  = "vnet-hub"
    location      = "centralus"
    address_space = "100.106.0.0/22"
    subnet = {
      "cidr01" = { cidr = "100.106.0.0/26" }, "name01" = { name = "subnet-mgmt" },
      "cidr02" = { cidr = "100.106.0.64/26" }, "name02" = { name = "subnet-internet" },
      "cidr03" = { cidr = "100.106.0.128/26" }, "name03" = { name = "subnet-dmz" },
      "cidr04" = { cidr = "100.106.0.196/26" }, "name04" = { name = "subnet-reserve1" },
      "cidr05" = { cidr = "100.106.1.0/25" }, "name05" = { name = "subnet-inside" },
      "cidr06" = { cidr = "100.106.1.128/25" }, "name06" = { name = "subnet-reserve2" },
      "cidr07" = { cidr = "100.106.2.0/27" }, "name07" = { name = "subnet-diag" },
      "cidr08" = { cidr = "100.106.2.32/27" }, "name08" = { name = "subnet-route-verify" },
      "cidr09" = { cidr = "100.106.2.64/27" }, "name09" = { name = "RouteServerSubnet" },
      "cidr10" = { cidr = "100.106.2.96/27" }, "name10" = { name = "AzureBastionSubnet" },
      "cidr11" = { cidr = "100.106.3.128/27" }, "name11" = { name = "GatewaySubnet" }
    }
  }
}
*/
rg1 = "rg-neteng-poc-eastus2"
rg2 = "rg-neteng-poc-centralus"
afw_ips = {
  centralus      = "100.102.2.68",
  eastus2        = "100.100.2.68",
  southcentralus = "100.104.2.68",
}
route_summaries = {
  centralus = "100.102.0.0/15",
  eastus2   = "100.100.0.0/15",
}
subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxx"
tags = {
  "creator"         = "skidane@aamva.org"
  "deployed"        = "Terraform"
  "supportGroup"    = "Network Engineering"
  "Environment"     = "LAB"
  "Billing Project" = "LAB"
  "System"          = "Network PoC"
  "deployed"        = "Terraform"
}
