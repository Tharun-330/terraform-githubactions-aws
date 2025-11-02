# Terraform Multi-Env (Refactored) - VPC + EC2

This repo demonstrates a refactored Terraform setup with:
- Modules for VPC and EC2
- Dynamic AMI lookup (Amazon Linux 2) with `data.aws_ami`
- Parameterized EC2 (instance_type, key_name, ami_id optional)
- Tag inheritance and environment-specific variables
- Environments: dev, qa, prod
- GitHub Actions workflow using OIDC (no static AWS keys)

## How to use
1. Create an S3 bucket and DynamoDB table for Terraform state.
2. Create the GitHub OIDC provider and IAM role with trust policy.
3. Update `.github/workflows/terraform.yml` with your role ARN.
4. Push to GitHub, run workflow_dispatch and choose environment (dev/qa/prod).
# terraform-aws-githubactions
