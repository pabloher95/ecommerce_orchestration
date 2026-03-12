variable "env_name" {
  description = "Environment name, should match workspace: dev|staging|prod"
  type        = string
}

variable "postgres_host_port" {
  type        = number
  description = "Host port for local Postgres"
}

variable "jenkins_port" {
  type        = number
  description = "Jenkins HTTP port"
}

variable "docker_registry" {
  type        = string
  description = "Docker Hub username/namespace, e.g. pabloher95"
}