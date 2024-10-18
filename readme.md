Providers.tf
```
terraform {
  cloud {
    organization = "vacuna-test"

    workspaces {
      tags = [
        "vacunas"
      ]
    }
  }
}
```

Run `terraform init` and `terraform apply`