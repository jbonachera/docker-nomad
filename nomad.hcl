data_dir = "/var/lib/nomad"
datacenter = "dc1"

client {
  enabled = true
  network_speed = 800
}

server {
  enabled = true
  bootstrap_expect = 3
}

