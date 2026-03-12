output "kubeconfig_path" {
  value       = module.minikube.kubeconfig_path
  description = "Path to kubeconfig for Minikube"
}

output "kube_context" {
  value       = module.minikube.kube_context
  description = "Kubernetes context for Minikube profile"
}

output "docker_registry" {
  value       = var.docker_registry
  description = "Docker registry namespace (Docker Hub username)"
}

output "postgres_connection" {
  value       = module.postgres.connection_string
  description = "Local Postgres connection string"
}

output "jenkins_url" {
  value       = module.jenkins.jenkins_url
  description = "Local Jenkins base URL"
}

output "minikube_ip" {
  value       = module.minikube.minikube_ip
  description = "Minikube cluster IP"
}