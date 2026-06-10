#!/bin/bash
set -e

echo "-------DEPLOYING TERRAFORM-------"

echo "-------INTIALIZING-------"
terraform -chdir=Terraform init

echo "-------PLANNING-------"
terraform -chdir=Terraform plan

echo "-------FORMATING-------"
terraform -chdir=Terraform fmt

echo "-------VALIDATE-------"
terraform -chdir=Terraform validate

echo "-------APPLYING-------"
terraform -chdir=Terraform apply -auto-approve

echo "-------STATE LISTS-------"
terraform -chdir=Terraform state list

echo "-------FINISHED------"
