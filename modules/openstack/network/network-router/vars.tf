variable "router_name" {
  description = "Name of the router"
  type        = string
  default = "my_router"
}

variable "network_public_id"{
        description = "ID of the public network"
        type        = string
}
variable "network_subnet_id"{
        description = "ID of the subnet"
        type        = string
}