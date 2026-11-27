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
