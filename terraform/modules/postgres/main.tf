resource "null_resource" "postgres" {
  triggers = {
    container_name = var.container_name
    volume_name    = var.volume_name
    image          = var.image
    host_port      = tostring(var.host_port)
    db_name        = var.db_name
    db_user        = var.db_user
    # don't put password in triggers; it will show up in state
  }

  provisioner "local-exec" {
    command = <<EOT
set -e
command -v docker >/dev/null 2>&1 || (echo "docker not found" && exit 1)

docker volume create "${var.volume_name}" >/dev/null

# remove existing container if present
docker rm -f "${var.container_name}" >/dev/null 2>&1 || true

docker run -d --name "${var.container_name}" \
  -p ${var.host_port}:5432 \
  -e POSTGRES_DB="${var.db_name}" \
  -e POSTGRES_USER="${var.db_user}" \
  -e POSTGRES_PASSWORD="${var.db_password}" \
  -v "${var.volume_name}:/var/lib/postgresql/data" \
  "${var.image}" >/dev/null
EOT
  }
}