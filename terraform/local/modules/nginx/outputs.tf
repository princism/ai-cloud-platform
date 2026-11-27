output "container_id" {
  description = "Docker container ID"
  value       = docker_container.nginx.id
}

output "container_name" {
  description = "Docker container name"
  value       = docker_container.nginx.name
}

output "nginx_url" {
  description = "Nginx access URL"
  value       = "http://localhost:${var.external_port}"
}
output "image_id" {
  description = "Nginx Docker image ID"
  value       = docker_image.nginx.image_id
}
