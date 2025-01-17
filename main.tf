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