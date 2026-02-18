variable "system_token" {
  description = "System token de kong"
  type = string
}

variable "control_plane_id" {
  description = "The name of the konnect gateway control plane"
}

variable "ash_consumer_id" {
  description = "Ash consumer id"
  type = string
}

variable "pokemon_live_upstream_name" {
  description = "Pokemon live upstream name"
  type = string
}

variable "pokemon_local_upstream_name" {
  description = "Pokemon local upstream name"
  type = string
}