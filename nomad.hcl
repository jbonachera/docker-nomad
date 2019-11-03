data_dir = "/var/lib/nomad"

datacenter = "dc1"

client {
  enabled = false
}

server {
  enabled          = true
  bootstrap_expect = 3
}

telemetry {
  disable_hostname           = true
  prometheus_metrics         = true
  publish_allocation_metrics = true
  publish_node_metrics       = true
  datadog_address            = "localhost:8125"
  collection_interval        = "10s"
}
