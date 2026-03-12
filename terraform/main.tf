locals {
  workspace = terraform.workspace
  env       = var.env_name != "" ? var.env_name : terraform.workspace
}

module "minikube" {
  source = "./modules/minikube"

  profile   = "ecommerce-${local.env}"
  cpus      = 4
  memory_mb = 6144
  driver    = "docker"
}

module "postgres" {
  source = "./modules/postgres"

  container_name = "ecommerce-db-${local.env}"
  volume_name    = "ecommerce-db-${local.env}"
  image          = "postgres:16"
  host_port      = var.postgres_host_port
  db_name        = "ecommerce"
  db_user        = "postgres"
  db_password    = "password"
}

module "jenkins" {
  source = "./modules/jenkins"

  http_port   = var.jenkins_port
}