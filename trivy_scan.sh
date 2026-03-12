cd /Users/pablohernandez/Documents/python_projects/devops/DevOpsProject

# Database
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/workspace aquasec/trivy image \
  --format json --output /workspace/database/docs/trivy-scan.json \
  --quiet pabloher95/ecommerce-database:latest

# Product service
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/workspace aquasec/trivy image \
  --format json --output /workspace/product-service/docs/trivy-scan.json \
  --quiet pabloher95/ecommerce-product-service:latest

# Order service
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/workspace aquasec/trivy image \
  --format json --output /workspace/order-service/docs/trivy-scan.json \
  --quiet pabloher95/ecommerce-order-service:latest

# Frontend
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/workspace aquasec/trivy image \
  --format json --output /workspace/ecommerce-frontend/docs/trivy-scan.json \
  --quiet pabloher95/ecommerce-frontend:latest