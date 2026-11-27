data "docker_network" "existing_bridge" {
  name = "bridge"
}

data "docker_network" "project_network" {
  name = docker_network.ai_network.name
}
