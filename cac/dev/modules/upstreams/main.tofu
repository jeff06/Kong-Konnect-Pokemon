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