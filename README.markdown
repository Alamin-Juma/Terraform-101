# Deploy EC2 Instance with CI/CD Pipeline

## Overview
This project demonstrates the deployment of an EC2 instance with a Node.js application using a CI/CD pipeline. The pipeline leverages Terraform for infrastructure as code (IaC), AWS ECR for Docker image management, and GitHub Actions for automation.

## What I Learned
- **Terraform Basics**: Setting up and managing AWS infrastructure using Terraform, including EC2 instances, security groups, IAM roles, and ECR repositories.
- **CI/CD with GitHub Actions**: Configuring workflows to automate deployment on push events, including Terraform initialization, planning, and application deployment.
- **Docker Integration**: Building and pushing Docker images to AWS ECR, handling image tagging, and deploying containers to EC2 instances.
- **AWS Services**: Utilizing AWS ECR, EC2, IAM, and S3 for state management, along with SSH-based deployment using `appleboy/ssh-action`.
- **Troubleshooting**: Resolving issues like missing ECR repositories, SSH connection failures, and Docker container deployment errors.
- **Security Practices**: Managing secrets (e.g., AWS credentials, SSH keys) using GitHub Secrets and configuring security groups for controlled access.

## Project Structure
- `terraform/`: Contains Terraform configuration files for infrastructure setup.
- `Dockerfile`: Defines the Node.js application container.
- `.github/workflows/deploy.yml`: GitHub Actions workflow for CI/CD.

## Deployment Steps
1. **Infrastructure Deployment**: Terraform provisions an EC2 instance, security group, IAM profile, and ECR repository.
2. **Application Deployment**: Builds a Docker image, pushes it to ECR, and deploys it to the EC2 instance via SSH.

## Future Improvements
- Add automated testing for the Node.js app.
- Implement HTTPS using a load balancer or reverse proxy.
- Enhance security with stricter IAM policies and VPC configurations.

## Acknowledgements
Thanks to the xAI community and AWS documentation for guidance throughout this journey!