output "karina-internal-ip" {
  value = openstack_compute_instance_v2.karina_instance.network[0].fixed_ip_v4
}
output "karina-floating-ip" {
  value = openstack_networking_floatingip_v2.floating_ip.address
}