def call(Map config = [:]) {
  def service = config.service ?: 'product-service'
  def registry = env.REGISTRY ?: 'pabloher95'
  def imageBase = "ecommerce-${service}"
  def fullImage = "${registry}/${imageBase}"
  def tags = [
    "build-${env.BUILD_NUMBER}",
    "git-${env.GIT_COMMIT?.take(7) ?: 'unknown'}"
  ]
  if (env.BRANCH_NAME == 'develop') {
    tags << 'latest'
  }
  if (env.BRANCH_NAME == 'main' || (env.BRANCH_NAME?.startsWith('release/'))) {
    def version = readVersion(service)
    if (version) tags << "v${version}"
  }
  node {
    checkout scm
    sh "docker build -t ${fullImage}:${tags[0]} ."
    tags.each { tag ->
      if (tag != tags[0]) {
        sh "docker tag ${fullImage}:${tags[0]} ${fullImage}:${tag}"
      }
    }
    env.DOCKER_IMAGE = fullImage
    env.DOCKER_TAG = tags[0]
  }
}

def readVersion(service) {
  if (service == 'database') {
    if (fileExists('VERSION')) {
      return readFile('VERSION').trim()
    }
    return '1.0.0'
  }
  if (fileExists('package.json')) {
    def pkg = readJSON file: 'package.json'
    return pkg.version ?: '1.0.0'
  }
  return '1.0.0'
}