def call(Map config = [:]) {
  def isFrontend = config.isFrontend ?: false
  node {
    checkout scm
    sh 'npm ci'
    if (fileExists('package.json') && sh(script: 'grep -q "\"lint\"" package.json', returnStatus: true) == 0) {
      sh 'npm run lint'
    }
    if (isFrontend) {
      sh 'npm run build'
    }
  }
}