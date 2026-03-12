output "host" { value = "localhost" }
output "port" { value = var.host_port }
output "container_name" { value = var.container_name }
output "connection_string" {
  value = "postgresql://${var.db_user}@localhost:${var.host_port}/${var.db_name}"
}