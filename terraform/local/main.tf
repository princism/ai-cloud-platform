terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.2.0"
    }
  }
}

provider "docker" {}

module "nginx" {
  source = "./modules/nginx"

  container_name = var.container_name
  nginx_image    = var.nginx_image
  external_port  = var.external_port
  internal_port  = var.internal_port
  network_name   = docker_network.ai_network.name
}

moved {
  from = docker_image.nginx
  to   = module.nginx.docker_image.nginx
}

moved {
  from = docker_container.nginx
  to   = module.nginx.docker_container.nginx
}
