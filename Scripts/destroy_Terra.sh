#!/bin/bash
set -e

echo "DESTROYING TERRAFORM"
echo "---------------------"
terraform -chdir=Terraform destroy -auto-approve
echo "-----TERRAFORM DESTROYED------"
