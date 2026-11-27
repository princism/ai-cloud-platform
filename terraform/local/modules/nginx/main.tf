terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "nginx" {
  name         = var.nginx_image
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = var.container_name
  image = docker_image.nginx.image_id

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = var.internal_port
    external = var.external_port
    ip       = "127.0.0.1"
  }
}
