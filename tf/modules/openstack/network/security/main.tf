terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}
resource "openstack_networking_secgroup_v2" "default_security_group" {
  name        = var.security_group_name
  description = "a Security Group managed by Terraform"
}

resource "openstack_networking_secgroup_rule_v2" "allow-ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.default_security_group.id
}

resource "openstack_networking_secgroup_rule_v2" "allow-ping" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.default_security_group.id

}