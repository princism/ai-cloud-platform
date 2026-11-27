locals {
  project_name = "ai-cloud-platform"
  environment  = "dev"

  name_prefix  = "${local.project_name}-${local.environment}"
  network_name = "${local.name_prefix}-network"

  common_labels = {
    project     = local.project_name
    environment = local.environment
    managed_by  = "terraform"
  }
}
