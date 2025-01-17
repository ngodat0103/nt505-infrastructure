variable "security_groups_name" {
        description = "The name of the security group"
        type        = list(string)
}
variable "fixed_ip_v4" {
        description = "The fixed IPv4 address for the instance"
        type        = string
        default     = "192.168.50.2"
}
variable "instance_name" {
        description = "The name of the instance"
        type        = string
        default     = "Karina"
}
variable "image_id" {
        description = "The image ID for the instance"
        type        = string
        default     = "b1d444fe-9376-43ad-a0c6-39877f4d8d0c"
}
variable "flavor_name" {
        description = "The flavor name for the instance"
        type        = string
        default     = "d60.xl8"
}
variable "network_id" {
        description = "The network ID for the instance"
        type        = string
}
variable "key_pair_name" {
        description = "The key pair for the instance"
        type        = string
}