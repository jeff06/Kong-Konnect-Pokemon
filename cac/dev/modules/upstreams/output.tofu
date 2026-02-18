output "pokemon_live_upstream_name" {
  value = konnect_gateway_upstream.pokemon_live_server.name
}

output "pokemon_local_upstream_name" {
  value = konnect_gateway_upstream.pokemon_local_server.name
}