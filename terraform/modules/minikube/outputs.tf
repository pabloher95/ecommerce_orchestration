output "profile" { value = var.profile }
output "kubeconfig_path" { value = pathexpand("~/.kube/config") }
output "kube_context" { value = "minikube" } # or "minikube-${var.profile}" depending on your setup
output "minikube_ip" { value = data.external.minikube_ip.result.ip }