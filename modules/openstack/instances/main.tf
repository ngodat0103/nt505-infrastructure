terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}
resource "openstack_compute_instance_v2" "karina_instance" {
  name            = var.instance_name
  image_id        = var.image_id
  flavor_name       = var.flavor_name
  key_pair        = var.key_pair_name
  security_groups = var.security_groups_name
  tags = ["gitlab-agent","hosted-some-app"]
  network {
    uuid = var.network_id
    fixed_ip_v4 = var.fixed_ip_v4
  }
}

data "openstack_networking_port_v2" "port_1" {
  fixed_ip = var.fixed_ip_v4
  depends_on = [openstack_compute_instance_v2.karina_instance]
}


resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "Public_Net"
  description = "Floating IP For ${openstack_compute_instance_v2.karina_instance.name}"
}
resource "openstack_networking_floatingip_associate_v2" "associate_floating_ip" {
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
  port_id = data.openstack_networking_port_v2.port_1.id
  depends_on = [openstack_compute_instance_v2.karina_instance]
}