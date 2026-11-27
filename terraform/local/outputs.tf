output "container_id" {
  description = "Docker container ID"
  value       = module.nginx.container_id
}

output "container_name" {
  description = "Docker container name"
  value       = module.nginx.container_name
}

output "nginx_url" {
  description = "Nginx access URL"
  value       = module.nginx.nginx_url
}
output "network_name" {
  description = "Docker network name"
  value       = docker_network.ai_network.name
}

output "network_id" {
  description = "Docker network ID"
  value       = docker_network.ai_network.id
}

output "existing_bridge_id" {
  description = "Existing Docker bridge network ID"
  value       = data.docker_network.existing_bridge.id
}

output "existing_bridge_driver" {
  description = "Existing Docker bridge network driver"
  value       = data.docker_network.existing_bridge.driver
}

output "existing_bridge_subnets" {
  description = "Existing Docker bridge network subnets"
  value = [
    for config in data.docker_network.existing_bridge.ipam_config :
    config.subnet
  ]
}

output "project_network_subnets" {
  description = "Project Docker network subnets"
  value = [
    for config in data.docker_network.project_network.ipam_config :
    config.subnet
  ]
}
