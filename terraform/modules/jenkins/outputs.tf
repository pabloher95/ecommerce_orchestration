output "jenkins_port" { value = var.http_port }
output "jenkins_url" { value = "http://localhost:${var.http_port}" }