data_dir = "/var/lib/nomad"
datacenter = "dc1"

client {
  enabled = false
}

server {
  enabled = true
  bootstrap_expect = 3
}

