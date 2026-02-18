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

resource "konnect_gateway_control_plane" "control_plane" {
  name = var.control_plane_name
  auth_type = "pki_client_certs"
  cloud_gateway = false
  cluster_type = "CLUSTER_TYPE_CONTROL_PLANE"
  description = "Udemy course"
  labels = {
    key = "Udemy"
    from = "IAC"
  }
}