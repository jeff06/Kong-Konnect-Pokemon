terraform {
  required_providers {
    konnect = {
      source  = "kong/konnect"
      version = "3.6.0"
    }
  }
}

provider "konnect" {
  system_account_access_token = var.system_token
}

module "control_planes" {
  source             = "../common/modules/control-planes"
  control_plane_name = var.control_plane_name
  system_token       = var.system_token
}

module "gateway_service" {
  source           = "../common/modules/gateway-services"
  system_token     = var.system_token
  control_plane_id = module.control_planes.control_plane_id
}

module "route" {
  source                         = "../common/modules/routes"
  system_token                   = var.system_token
  control_plane_id               = module.control_planes.control_plane_id
  gateway_pokemon_live_server_id = module.gateway_service.pokemon_live_server_id
}

module "consumer" {
  source           = "./modules/consumers"
  system_token     = var.system_token
  control_plane_id = module.control_planes.control_plane_id
}

module "upstream" {
  source           = "./modules/upstreams"
  system_token     = var.system_token
  control_plane_id = module.control_planes.control_plane_id
}

module "plugins" {
  source                      = "./modules/plugins"
  system_token                = var.system_token
  control_plane_id            = module.control_planes.control_plane_id
  ash_consumer_id             = module.consumer.ash_consumer_id
  pokemon_live_upstream_name  = module.upstream.pokemon_live_upstream_name
  pokemon_local_upstream_name = module.upstream.pokemon_local_upstream_name
}