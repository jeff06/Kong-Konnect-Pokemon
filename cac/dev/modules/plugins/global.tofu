resource "konnect_gateway_plugin_key_auth" "global" {
  config = {
    hide_credentials = false
    key_in_body      = false
    key_in_header    = true
    key_in_query     = false
    key_name = [
      "apikey",
      "apiroute"
    ]
    identity_realms = [
      {
        id     = null
        region = null
        scope  = "cp"
      }
    ]
  }
  control_plane_id = var.control_plane_id
  enabled          = true
  tags = [
    "IAC"
  ]
}

resource "konnect_gateway_plugin_prometheus" "global" {
  config = {
    ai_metrics              = false
    bandwidth_metrics       = true
    latency_metrics         = true
    pre_consumer            = true
    status_code_metrics     = true
    upstream_health_metrics = true
    wasm_metrics            = true
  }
  control_plane_id = var.control_plane_id
  enabled          = true
  instance_name    = "prometheus-global"
  tags = [
    "IAC"
  ]
}