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
