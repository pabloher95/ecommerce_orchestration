terraform {
  required_version = ">= 1.5.0"
  backend "local" {
    path = "state/terraform.tfstate"
  }

  required_providers {
    null  = { source = "hashicorp/null",  version = "~> 3.2" }
    local = { source = "hashicorp/local", version = "~> 2.4" }
  }
}

provider "null" {}
provider "local" {}