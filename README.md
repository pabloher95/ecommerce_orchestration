### Containerization with Docker

Ensure that npm is installed in every repo and that it produces a `package-lock.json` file
`cd /microservice/`
`npm install` 

Run services locally
`docker-compose build`
`docker-compose up -d`

Run scan script and store results in each service's repo
`chmod +x trivy-scan.sh`
`./trivy_scan.sh`

Push service images to Docker Hub
`docker login`
`docker push {username}/{docker-image}:latest`

### CI/CD Pipeline with Jenkins
Run Jenkins
`brew install jenkins-lts`
`brew services start jenkins-lts`

Configure Jenkins local credentials
Add Node.js and Pipeline Utility Steps plugin in Jenkins configs
Configure Docker Hub PAT for access via Jenkins
Configure Github PAT to use in Github Sever configs in Jenkins and pipeline-level authentication to prevent anonymous query limits
Run ngrok to expose Jenkins and bind the URL to the repo's webhook

## Kubernetes Orchestration
Kubernetes orchestration requires check that minikube is running from Terraform deploy: `minikube status -p ecommerce-dev`

