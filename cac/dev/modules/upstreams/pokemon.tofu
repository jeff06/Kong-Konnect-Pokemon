resource "konnect_gateway_upstream" "pokemon_live_server" {
  algorithm        = "round-robin"
  control_plane_id = var.control_plane_id
  hash_on          = "none"
  name             = "pokemon_live_server"
  slots            = 10000
  tags = [
    "IAC"
  ]
}

resource "konnect_gateway_target" "pokemon_live_server" {
  control_plane_id = var.control_plane_id
  target           = "pokeapi.co"
  upstream_id      = konnect_gateway_upstream.pokemon_live_server.id
  weight           = 100
  tags = [
    "IAC"
  ]
}

resource "konnect_gateway_upstream" "pokemon_local_server" {
  algorithm        = "round-robin"
  control_plane_id = var.control_plane_id
  hash_on          = "none"
  name             = "pokemon_local_server"
  slots            = 10000
  tags = [
    "IAC"
  ]
}

resource "konnect_gateway_target" "pokemon_local_server" {
  control_plane_id = var.control_plane_id
  target           = "0.0.0.0:8000"
  upstream_id      = konnect_gateway_upstream.pokemon_local_server.id
  weight           = 100
  tags = [
    "IAC"
  ]
}