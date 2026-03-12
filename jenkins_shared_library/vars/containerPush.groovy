def call(Map config = [:]) {
  def service = config.service ?: 'product-service'
  def registry = env.REGISTRY ?: 'pabloher95'
  def imageBase = "ecommerce-${service}"
  def fullImage = "${registry}/${imageBase}"
  def tags = [
    "build-${env.BUILD_NUMBER}",
    "git-${env.GIT_COMMIT?.take(7) ?: 'unknown'}"
  ]
  if (env.BRANCH_NAME == 'develop') tags << 'latest'
  if (env.BRANCH_NAME == 'main' || (env.BRANCH_NAME?.startsWith('release/'))) {
    def version = readVersion(service)
    if (version) tags << "v${version}"
  }
  node {
    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
      sh 'echo $PASS | docker login -u $USER --password-stdin'
      tags.unique().each { tag ->
        sh "docker push ${fullImage}:${tag}"
      }
    }
  }
}

def readVersion(service) {
  if (service == 'database') {
    if (fileExists('VERSION')) return readFile('VERSION').trim()
    return '1.0.0'
  }
  if (fileExists('package.json')) {
    def pkg = readJSON file: 'package.json'
    return pkg.version ?: '1.0.0'
  }
  return '1.0.0'
}