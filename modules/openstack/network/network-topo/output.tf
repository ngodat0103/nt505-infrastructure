output "network_subnet_id" {
  value = openstack_networking_subnet_v2.default_subnet.id
}
output "network_id" {
  value = openstack_networking_network_v2.default_network.id
}