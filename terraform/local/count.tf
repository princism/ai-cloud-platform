resource "docker_container" "nginx_count" {
  count = 2

  name  = "${local.name_prefix}-nginx-count-${count.index}"
  image = module.nginx.image_id

  networks_advanced {
    name = docker_network.ai_network.name
  }

  ports {
    internal = 80
    external = 8083 + count.index
    ip       = "127.0.0.1"
  }
}
