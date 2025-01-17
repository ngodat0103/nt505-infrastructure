terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}
resource "openstack_networking_router_v2" "default_router" {
  name                = var.router_name
  admin_state_up      = true
  external_network_id = var.network_public_id
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = openstack_networking_router_v2.default_router.id
  subnet_id = var.network_subnet_id
}