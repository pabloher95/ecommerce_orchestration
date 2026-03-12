### Containerization with Docker

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