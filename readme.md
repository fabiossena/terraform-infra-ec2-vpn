# AWS and Terraform Setup Guide

## Prerequisites Installation

### Install AWS CLI and Terraform on Local Machine
1. **AWS CLI**: Download and install from [AWS CLI official page](https://aws.amazon.com/cli/)
2. **Terraform**: Download and install from [Terraform official page](https://www.terraform.io/downloads.html)

## AWS Configuration

### Create IAM User with Administrative Access
1. Navigate to AWS Console → IAM → Users
2. Click "Add user" and provide a username
3. Select "Programmatic access" for access type
4. Attach the "AdministratorAccess" policy directly or via a group
5. Complete the user creation process

### Generate Access Keys
1. In the IAM user details page, navigate to "Security credentials" tab
2. Click "Create access key"
3. Select "Command Line Interface (CLI)" as the use case
4. Download and securely store the Access Key ID and Secret Access Key

## SSH Configuration

### Generate SSH Key Pair
1. Open terminal/command prompt on your local machine
2. Run the following command to generate an SSH key pair:
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
3. When prompted for file location, you can accept the default or specify a custom path
4. Set a secure passphrase when prompted (optional but recommended)

### Configure Terraform with SSH Key
1. Locate your SSH public key file (typically `~/.ssh/id_rsa.pub` on Linux/Mac or `C:\Users\<username>\.ssh\id_rsa.pub` on Windows)
2. In your `main.tf` file, reference the public key file path:
   ```hcl
   resource "aws_key_pair" "example" {
     key_name   = "my-key"
     public_key = file("C:/Users/<username>/.ssh/id_rsa.pub")
   }
   ```

## Terraform Operations

### Deploy Infrastructure
To deploy the infrastructure using Terraform:bash
terraform init    # Initialize the working directory
terraform plan    # Review the execution plan
terraform apply   # Apply the configuration and create resources

### Destroy Infrastructure
To tear down the infrastructure and clean up resources:bash
terraform destroy  # Remove all resources managed by Terraform
**Note**: Always review the destruction plan carefully before confirming, as this action is irreversible.
