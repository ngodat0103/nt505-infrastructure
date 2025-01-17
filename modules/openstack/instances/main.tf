terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}
resource "openstack_compute_instance_v2" "basic" {
  name            = "test-server"
  image_id        = "b1d444fe-9376-43ad-a0c6-39877f4d8d0c"
  flavor_name       = "d60.xl8"
  key_pair        = "my public key"
  security_groups = ["mySecurity"]
  metadata = {
    this = "that"
  }
  network {
    name = "mynet_local"
  }
}