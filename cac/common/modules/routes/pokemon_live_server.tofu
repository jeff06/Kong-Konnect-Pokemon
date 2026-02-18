resource "konnect_gateway_route" "pokemon" {
  control_plane_id = var.control_plane_id
  name = "Pokemon"
  protocols = ["https"]
  paths = ["/pokemon"]
  strip_path = true
  service = {
    id = var.gateway_pokemon_live_server_id
  }
}