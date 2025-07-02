Pharma Lab Complete Project

Overview
Pharma Lab Complete Project is a cloud-based infrastructure and application deployment setup for managing pharmaceutical lab services. It leverages AWS for infrastructure provisioning using Terraform and deploys microservices (URP, Alex, Raven) using Docker and Helm charts for Kubernetes orchestration. The project is structured to support multiple environments (dev, staging, prod) with CI/CD integration via GitHub Actions.

Prerequisites To set up and deploy this project, ensure you have the following tools installed: 
Terraform (>= 1.2.0): For infrastructure provisioning. 
AWS CLI: Configured with appropriate credentials. 
Docker: For building and pushing service images. 
Helm: For deploying Kubernetes resources. 
kubectl: For interacting with the EKS cluster. 
GitHub CLI (optional): For managing GitHub Actions.

Setup --> Infrastructure Setup --> Service Deployment --> CI/CD Pipeline

CI/CD Pipeline
The .github/workflows/deploy.yml file defines the CI/CD pipeline using GitHub Actions.
It automates building Docker images, pushing them to ECR, and deploying Helm charts to the EKS cluster.
Configure GitHub Secrets for AWS credentials (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) and other sensitive data.

Environment Details
Dev: Used for development and testing. Configured with minimal resources (e.g., 2 EKS nodes).
Staging: Mirrors production for pre-release testing. Uses a slightly larger EKS cluster (3 nodes).
Prod: Production environment with higher capacity (4 EKS nodes) and separate database/secret names.

Monitoring
Prometheus targets and Grafana dashboards to ensure metrics for urp, alex, and raven.
