locals {
  project = "portal-vacunas"
}

locals {
  ami = (
    var.environment == "stage"
    ? "ami-xxxxxxxxxxxxx"
    : "ami-xxxxxxxxxxxxx"
  )

  instance_type = (
    var.environment == "stage"
    ? "t2.micro"
    : "t3.large"
  )

  key_name = "Web-Portal-Key"
}

locals {
  // tags ec2
  tags_ec2 = {
    Name        = "${local.project}-${var.environment}"
    Environment = var.environment
  }

  // tags security group
  tags_sg = {
    Name        = "${local.project}-${var.environment}-sg"
    Environment = var.environment
  }
}
