variable "hub" {
  type = list(
    map(
      list(
        object({
          vnet_rg       = string
          topology      = string
          gateway_name  = string
          location      = string
          address_space = string
          subnet = list(
            object({
              cidr = string
              name = string
            })
          )
        })
      )
    )
  )
 default = null
}
####--------------------------------------------------------------------
hub = [{
  vne-hub-eastus2 = [{
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
   ],
  { vnet-hub-centralus = [{
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
  ]}
}]