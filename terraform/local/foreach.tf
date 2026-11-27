resource "docker_container" "nginx_each" {
  for_each = local.nginx_instances

  name  = "${local.project_name}-nginx-${each.key}"
  image = module.nginx.image_id

  networks_advanced {
    name = docker_network.ai_network.name
  }

  ports {
    internal = 80
    external = each.value.port
    ip       = "127.0.0.1"
  }
}
