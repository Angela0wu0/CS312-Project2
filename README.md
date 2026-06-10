# CS312-Project2
## Background
### Purpose
The purpose of this GitHub Repo is to provide fully automated creation of a Minecraft Server (provisioning, configuration, and setup).

### How It Works
This automation will run the script to create an AWS EC2 Instance using Terraform 


## Requirements
- Ubuntu Environment or WSL
- AWS CLI
- Terraform
- Nmap

## Installing the Requirements
Open your command line interface. On Windows is called Command Prompt, and Terminal for Linux users.

### Installing WSL (OPTIONAL For Ubuntu Users)
Then run the following command:

`wsl --install`

Verify the installation by running the following command:

`wsl --version`

### Installing AWS CLI
For those using WSL, run the following command first:

`wsl`

Then run the following command:

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

Verify if AWS CLI is installed properly by running the following command:

`aws --version`

You should see something similar to:

>aws-cli/2.34.64 Python/3.14.5 Linux/6.18.33.1-microsoft-standard-WSL2 exe/x86_64.ubuntu.24

### Installing Terraform

### Installing Nmap

Diagram 

Connecting to the Minecraft Server

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
