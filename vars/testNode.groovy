def call() {
  node {
    if (fileExists('package.json') && sh(script: 'grep -q "\"test\"" package.json', returnStatus: true) == 0) {
      sh 'npm test -- --passWithNoTests --watchAll=false'
    }
  }
}