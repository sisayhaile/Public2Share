variable "rg1" {
  default = null
}
variable "rg2" {
  default = null
}
variable "hub" {
  type    = list(list(map(string)))
  default = null
}
variable "tags" {
  default = null
}
variable "subscription_id" {
  default = null
}