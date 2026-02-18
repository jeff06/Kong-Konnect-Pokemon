resource "konnect_gateway_plugin_rate_limiting" "ash" {
  config = {
    error               = 429
    error_message       = "API rate limit exceeded"
    fault_tolerant      = true
    hide_client_headers = false
    limit_by            = "consumer"
    policy              = "local"
    second              = 3
    sync_rate           = -1
  }
  consumer = {
    id = var.ash_consumer_id
  }
  control_plane_id = var.control_plane_id
  instance_name    = "ash_rate_limiting"
  protocols = ["https"]
  tags = ["IAC"]
}

resource "konnect_gateway_plugin_route_by_header" "ash" {
  config = {
    rules = [
      {
        condition = {
          apiroute = "poke"
        }
        upstream_name = var.pokemon_live_upstream_name
      },
      {
        condition = {
          apiroute = "pokelocal"
        }
        upstream_name = var.pokemon_local_upstream_name
      }
    ]
  }
  consumer = {
    id = var.ash_consumer_id
  }
  control_plane_id = var.control_plane_id
  enabled       = true
  instance_name = "ash_route_by_header"
  protocols = [
    "https"
  ]
  tags = [
    "IAC"
  ]
}