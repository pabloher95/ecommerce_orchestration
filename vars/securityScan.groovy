def call(Map config = [:]) {
  def service = config.service ?: 'product-service'
  def imageName = "pabloher95/ecommerce-${service}"
  node {
    if (fileExists('package.json')) {
      sh 'npm audit --audit-level=high || true'
    }
    sh """
      docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
        aquasec/trivy image ${imageName}:latest || true
    """
  }
}