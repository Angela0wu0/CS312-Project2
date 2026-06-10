#!/bin/bash
set -e

echo "Creating the EC2 Instatnce"
./Scripts/bootstrap-ec2.sh

echo "Set-Up Minecraft Server"
./Scripts/deployment.sh


