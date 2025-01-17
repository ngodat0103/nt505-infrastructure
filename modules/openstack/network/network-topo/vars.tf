variable "network_subnet" {
        description = "The subnet for the network"
        type        = string
        default     = "192.168.50.0/24"
}
variable "network_name" {
        description = "The name of the network"
        type        = string
        default     = "Lab-network"
}

variable "dns_nameservers" {
        description = "The DNS nameserver for the network"
        type        = list(string)
        default     = ["8.8.8.8","1.1.1.1"]
}
