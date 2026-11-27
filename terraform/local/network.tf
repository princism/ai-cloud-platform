resource "docker_network" "ai_network" {
  name   = local.network_name
  driver = "bridge"
}
