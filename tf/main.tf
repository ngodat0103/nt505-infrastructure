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
  flavor_name = "d60.l4"
  image_id = "85e829b6-c19c-4dec-b3cd-aca00cbfc6d8"
  fixed_ip_v4 = "192.168.50.10"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD1mqJ9VFW25ZILkw2pDbnFaa59O0pBIEDbT/V9R/HZT53Jgq+MNnS1pUAyIXEpu6Rf+HqiqhXtnwlnw2dLhL3VYiGFNA/ZxK7Jgemr1uQqgYNqtNQbFz4LBsN3/oR2gW4wFCUqS0CqA25xV30RhO0VRZEf1Ks+unCwbY8xQUsjTPYC5ief7OmGmP/fouTn84M04njptzRHfeJ1YAmm5PX1hewyaZN3zhW8R/6kHvqLg492/ywJ3Fh3qZk8Qu2STzPwfDRRzwuGkKEuO6itl9awe6uWE8gFGZoUsIQt3hjU2GCmLCvj2My+HCUBH1yz/aUo5iQuTbQFdDlwOIRppa+4ZsawHUSZnBrgzXjn3HGYb6XGNuWBzjXm2+XHlomex/5I3/sxCjVoME/IYgZxoGVPeJZSQ6cOYjU6PYK3+ygkbgWqVYrkBC0BJGruoAsDo5SUv27ShxIs7vZple+U3AhthGiCbjvSIv5GwpJwnYcHDcH46N35mTJNkweQzEHrqQ8= akira@legion"
}

output "karina-internal-ip" {
  value = module.instances.karina-internal-ip
}
output "karina-floating-ip" {
  value = module.instances.karina-floating-ip
}
