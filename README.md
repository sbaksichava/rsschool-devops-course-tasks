# Terraform Infrastructure Setup

## Steps

- **Installed AWS CLI and Terraform**

  - Followed the instructions to install AWS CLI 2.
  - Followed the instructions to install Terraform 1.6+.

- **Created IAM User and Configured MFA**

  - In AWS IAM, created a new user with the following policies attached:
    - AmazonEC2FullAccess
    - AmazonRoute53FullAccess
    - AmazonS3FullAccess
    - IAMFullAccess
    - AmazonVPCFullAccess
    - AmazonSQSFullAccess
    - AmazonEventBridgeFullAccess
  - Configured MFA for both the new user and the root user.
  - Generated a new pair of Access Key ID and Secret Access Key for the user.

- **Configured AWS CLI**

  - Configured AWS CLI to use the new user's credentials.
  - Verified the configuration by running the command: `aws ec2 describe-instance-types --instance-types t4g.nano`.

- **Created a GitHub Repository for Terraform Code**

  - Created a repository `rsschool-devops-course-tasks`.

- **Created a Bucket for Terraform States**

  - Managed Terraform states following best practices with S3 as backend.

- **Created an IAM Role for GitHub Actions**

  - Created an IAM role `GithubActionsRole` with the same permissions as in step 2.

- **Configured Identity Provider and Trust Policies for GitHub Actions**

  - Updated the `GithubActionsRole` IAM role with Trust policy according to AWS guidelines.

- **Created a GitHub Actions Workflow for Deployment via Terraform**
  - Implemented a workflow with three jobs:
    - `terraform-check` for format checking with `terraform fmt`
    - `terraform-plan` for planning deployments with `terraform plan`
    - `terraform-apply` for deploying with `terraform apply`
