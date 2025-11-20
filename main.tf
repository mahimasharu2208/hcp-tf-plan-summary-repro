terraform {
  # Define the required providers and their versions
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Terraform Cloud/Enterprise Configuration
  cloud {
    # Replace 'my-organization' with your actual TFC organization name
    organization = "mahima-test" 
    
    workspaces {
      # Replace 'my-tfc-workspace' with the name of your workspace
      name = "github-actions-test" 
    }
  }
}

# 1. Configure the AWS Provider
provider "aws" {
  region = "us-east-1" 
}

# 2. Define the S3 Bucket Resource
resource "aws_s3_bucket" "test_bucket" {
  # IMPORTANT: CHANGE THIS TO A GLOBALLY UNIQUE NAME
  # Example: "tfc-test-012345-your-name"
  bucket = "unique-bucket-name-2025-tfc-app"

  tags = {
    Name        = "Minimal-Test-Bucket"
    Environment = "Test"
  }
}

# 3. Ensure the bucket is not publicly accessible
resource "aws_s3_bucket_public_access_block" "test_block" {
  bucket = aws_s3_bucket.test_bucket.id

  # Setting all to true ensures private access, which is generally safe for tests
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 4. Output the created bucket name
output "s3_bucket_name" {
  description = "The globally unique name of the S3 bucket."
  value       = aws_s3_bucket.test_bucket.bucket
}
