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

resource "konnect_gateway_service" "pokemon_live_server" {
  control_plane_id = var.control_plane_id
  enabled          = true
  host             = "google.com"
  name             = "Pokemon_Live_Server"
  path             = "/api/v2"
  port             = 443
  protocol         = "https"
  tags = [
    "IAC"
  ]
}