resource "konnect_gateway_consumer" "ash" {
  control_plane_id = var.control_plane_id
  username = "Ash"
  custom_id = "Ash_id"
}

resource "konnect_gateway_key_auth" "ash_api_key" {
  consumer_id = konnect_gateway_consumer.ash.id
  control_plane_id = var.control_plane_id
  # En production, cette valeur devrait venir d'une vault externe à kong.
  key = "EFtkRK1M7h5qt2GQY0RGPhqE7Qt5wqt9"
}