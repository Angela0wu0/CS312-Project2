# CS312-Project2
## Background
### Purpose
The purpose of this project is to automate the creation of a Minecraft Java Edition Server (provisioning, configuration, and setup) on an AWS EC2 Instance **without** ever accessing the AWS Management Console. Though, except for accessing the AWS Learner Lab to start the Lab and to retrieve the AWS Academy CLI Credentials.

### How It Works
The deployment of the Minecraft Java Edition Server is an automated infrastructure pipeline that will: use Terraform to provision the AWS resources, and a BASH script to SSH into the created EC2 Instance and set up and install the Minecraft server. Upon successful completion, the server is verified using Nmap:

`nmap -sV -Pn -p T:25565 <instance_public_ip>`

## Repository Structure
```
CS312-Project2/
|   install.sh
|   README.md
|   |
+---Scripts
|   |   bootstrap-ec2.sh
|   |   deployment.sh
|   |   destroy_Terra.sh
|   |
|   ---Key
+---Terraform
|   |   .terraform.lock.hcl
|   |   dev-key.tf
|   |   ec2.tf
|   |   main.tf
|   |   networks.tf
|   |   outputs.tf
|   |   variables.tf
|
---Testing
        test-re-mc.sh
        test-server.sh
```
## Pipeline Diagram
```mermaid
graph LR
    A[Your Machine/VM] --> B(Clone This Repo)
    B --> C[AWS Academy CLI Credentials]
    C --> D[Terraform Bootstrap Creates EC2 Instance]
    D --> E[Deploying Minecraft Server Onto EC2 Instance Using BASH Script]
    E --> F[Verify Minecraft Server With Nmap]
```

## Requirements
- Git
- Ubuntu Environment or WSL
- AWS CLI
- Terraform
- Nmap

## Installing the Requirements
Open your command line interface. On Windows is called Command Prompt, and Terminal for Linux users.

### Installing Git


### Installing WSL (OPTIONAL For Ubuntu Users)
Run the following command:

```
wsl --install
```

Verify the installation by running the following command:

```
wsl --version
```

### Installing AWS CLI
For those using WSL, run the following command first:

```
wsl
```

Then run the following command:

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

Verify if AWS CLI is installed properly by running the following command:

```
aws --version
```

You should see something similar to:

>aws-cli/2.34.64 Python/3.14.5 Linux/6.18.33.1-microsoft-standard-WSL2 exe/x86_64.ubuntu.24

### Installing Terraform

### Installing Nmap


## How to Run This Automation
### Step 1: Cloning This Repository
1. In your Command Line Interface, move to your desired folder location to clone this Repository. Use the `cd` command followed by the path to your folder location:

```cd /path/to/folder```

2. Now use the `git clone` command:

```git clone https://github.com/Angela0wu0/CS312-Project2.git```

3. Access the cloned repository with:

```cd CS312-Project2```

### Step 2: Setting Up The AWS Credentials
We will need the AWS Credentials found in the [AWS Academy Learner Lab](https://www.awsacademy.com/vforcesite/LMS_Login)
1. Start the AWS Learner Lab 
   - Log in to your AWS Academy and access the AWS Academy Learner Lab.
   - Click 'Start Lab'.
   - Once the `red` dot turns `green`, click 'AWS Details':
   Next to `AWS CLI:` click `SHOW` (Stay on this page, we will need this for the next step)

2. Copy the AWS CLI Credentials Into Our Local Machine
>NOTE: You will copy all the content in `SHOW` into '~/.aws/credentials'.
   - Use the following command:
   ```
   vim ~/.aws/credentials
   ```
   - Press `i` on the keyboard, and the bottom left of the terminal now says `INSERT`.
   - Copy the entire credential shown in `Step 2`.
   - When copied over, the format should look something like:
        ```
        [default]
        aws_access_key_id=YOUR_ACCESS_KEY
        aws_secret_access_key=YOUR_SECRET_KEY
        aws_session_token=YOUR_SESSION_TOKEN
        ```
   - In addition to this file, add the default region:
        ```
        region=us-east-1 #use your preferred region
        ```
   - Then hit `Esc` and type `:` using `shift + ;`.
   - Then type `wq` and hit `Enter`.
3. Verify if the AWS credentials have been properly stored locally and are accessible by AWS CLI.
   - Run the following command:
     ```
     aws sts get-caller-identity
     ```
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
