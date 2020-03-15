module "k3os_storage_pool" {
  source  = "../modules/k3os-storage-pool"
  storage_pool_name = "k3os_pool"
}

module "k3os_server" {
  source = "../modules/k3os-instance"
  hostname = "k3os-server"
  role = "server"
  storage_pool_name = module.k3os_storage_pool.pool_name
  k3s_server_additional_args = [
    "--no-deploy=traefik"
    ]
}

module "k3os_agent1" {
  source = "../modules/k3os-instance"
  hostname = "k3os-agent1"
  role = "agent"
  storage_pool_name = module.k3os_storage_pool.pool_name
  server_url = "https://${module.k3os_server.hostname}:6443"
}

module "k3os_agent2" {
  source = "../modules/k3os-instance"
  hostname = "k3os-agent2"
  role = "agent"
  storage_pool_name = module.k3os_storage_pool.pool_name
  server_url = "https://${module.k3os_server.hostname}:6443"
}

module "k3os_agent3" {
  source = "../modules/k3os-instance"
  hostname = "k3os-agent3"
  role = "agent"
  storage_pool_name = module.k3os_storage_pool.pool_name
  server_url = "https://${module.k3os_server.hostname}:6443"
}