variable "name" {}
variable "cidr" {}
variable "public_subnet_count" {
  default = 2
}
variable "azs" {
  type = list(string)
}
