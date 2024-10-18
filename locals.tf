# General
locals {
  # Environment
  environment = reverse(split("-", terraform.workspace))[0]
  create      = "Terraform"
  owner       = "Developers"
}

# Tags
locals {
  tags = {
    Create = local.create
    Owner  = local.owner
  }
}
