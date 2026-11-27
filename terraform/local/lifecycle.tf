resource "terraform_data" "app_version" {
  input = "2.0.0"
}

resource "docker_container" "lifecycle_demo" {
  name  = "terraform-lifecycle-v2"
  image = module.nginx.image_id

  lifecycle {
    replace_triggered_by = [
      terraform_data.app_version
    ]
  }
}

