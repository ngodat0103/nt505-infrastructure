terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

resource "openstack_networking_network_v2" "default_network" {
  name           = var.network_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "default_subnet" {
  name       = "${var.network_name}-subnet"
  network_id = openstack_networking_network_v2.default_network.id
  cidr       = var.network_subnet
  ip_version = 4
  dns_nameservers = var.dns_nameservers
}

