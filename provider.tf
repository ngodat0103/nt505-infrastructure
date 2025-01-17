terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

# Configure the OpenStack Provider
# docs https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs
provider "openstack" {
  cloud = "openstack"
}
