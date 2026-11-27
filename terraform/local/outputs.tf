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

