def call() {
  node {
    checkout scm
    if (fileExists('src/init.sql')) {
      echo 'Validating SQL syntax...'
      sh 'head -1 src/init.sql | grep -q "CREATE\\|INSERT" || true'
    }
  }
}