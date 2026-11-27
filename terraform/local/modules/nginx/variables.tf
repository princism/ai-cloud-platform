variable "container_name" {
  description = "Name of the Nginx container"
  type        = string
  default     = "terraform-nginx"
}

variable "nginx_image" {
  description = "Nginx Docker image"
  type        = string
  default     = "nginx:alpine"
}

variable "external_port" {
  description = "External port of Nginx"
  type        = number
  default     = 8081
}

variable "internal_port" {
  description = "Internal port of Nginx"
  type        = number
  default     = 80
}
