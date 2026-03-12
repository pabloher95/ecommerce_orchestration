def call(Map config = [:]) {
  def service = config.service ?: 'product-service'
  def env = config.env ?: (env.BRANCH_NAME == 'main' ? 'prod' : env.BRANCH_NAME == 'develop' ? 'dev' : 'staging')
  node {
    if (env == 'prod') {
      input message: "Deploy ${service} to Production?", ok: 'Deploy'
    }
    echo "Deploying ${service} to ${env} environment"
    // TODO: Add SSH + docker-compose for dev/staging, kubectl for prod
  }
}