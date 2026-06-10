#!/bin/bash
set -e

# IMPORTANT: Only run this script if you want to delete the EC2 Instance

echo "DESTROYING TERRAFORM"
echo "---------------------"
terraform -chdir=Terraform destroy -auto-approve
echo "-----TERRAFORM DESTROYED------"
