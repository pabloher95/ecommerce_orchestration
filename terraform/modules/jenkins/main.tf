resource "null_resource" "jenkins" {
  triggers = {
    http_port = tostring(var.http_port)
  }

  provisioner "local-exec" {
    command = <<EOT
set -e
command -v brew >/dev/null 2>&1 || (echo "brew not found" && exit 1)

# assumes jenkins-lts is installed already
brew services start jenkins-lts || true

echo "Jenkins should be available at http://localhost:${var.http_port}"
EOT
  }
}