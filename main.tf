module "network-topo" {
  source = "./modules/openstack/network/network-topo"
}

module "network-router" {
  source = "./modules/openstack/network/network-router"
  network_public_id = "c3455e8f-ea16-4f5d-ad5e-5c4292015a0d"
  network_subnet_id = module.network-topo.network_subnet_id
}

module "security" {
  source = "./modules/openstack/network/security"
  security_group_name = "Lab-Security-Group"
}

module "instances" {
  source = "./modules/openstack/instances"
  instance_name = "karina"
  security_groups_name = [module.security.security_group_name]
  network_id = module.network-topo.network_id
  fixed_ip_v4 = "192.168.50.10"
  key_pair_name = "my public key"
}