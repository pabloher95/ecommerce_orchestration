resource "null_resource" "minikube" {
  triggers = {
    profile   = var.profile
    cpus      = tostring(var.cpus)
    memory_mb = tostring(var.memory_mb)
    driver    = var.driver
    addons    = join(",", var.addons)
  }

  provisioner "local-exec" {
    command = <<EOT
set -e
command -v minikube >/dev/null 2>&1 || (echo "minikube not found" && exit 1)

minikube start -p "${var.profile}" --cpus=${var.cpus} --memory=${var.memory_mb} --driver=${var.driver}

for addon in ${join(" ", var.addons)}; do
  minikube addons enable "$addon" -p "${var.profile}" || true
done
EOT
  }
}

data "external" "minikube_ip" {
  program = ["bash", "-lc", "minikube ip -p '${var.profile}' | jq -R '{ip: .}'"]
  depends_on = [null_resource.minikube]
}