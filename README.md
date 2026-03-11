# End-to-End DevOps Pipeline for a Web Application with CI/CD
## Objectives: To Deploy application Using End-to-End Devops Pipline
## Problem Statement
DevOps teams require a CI/CD pipeline to streamline the development and deployment process, ensuring that changes are consistently tested, built, and deployed across environments. Using Jenkins as the CI/CD orchestrator, this project will implement an automated pipeline for a Dockerized application that deploys to Kubernetes on AWS EKS. Jenkins will also automate infrastructure provisioning, configuration management, and deployment, reducing manual intervention and improving efficiency.

## Project Goals
1. Design an application architecture that includes load balancing, container orchestration, and monitoring on AWS.
2. Provision AWS infrastructure using Terraform, including VPC, subnets, and EKS clusters.
3. Automate configuration management with Ansible to streamline server setup and application configuration.
4. Deploy the application on Kubernetes within AWS EKS, ensuring scalability and resilience.
5. Implement Jenkins CI/CD for continuous integration and deployment from code changes to production.
6. Set up monitoring with Prometheus and Grafana to monitor infrastructure and application performance.
   
## Additional Tools for CI/CD Integration
- Jenkins: For orchestrating the CI/CD pipeline to automate testing, building, and deployment.
- Docker: For building container images as part of the CI pipeline.
- Kubernetes CLI (kubectl): For managing and deploying resources to EKS within the Jenkins pipeline.
- Jenkins Plugins: Docker, Kubernetes, and AWS CLI plugins for seamless integration with cloud infrastructure.

# Project Sprints:

## Sprint 1: Architecture Design, Dockerization, and Jenkins Setup
- Tasks:
  - Design the application architecture for deployment on AWS EKS.
  - Dockerize the web application by creating a Dockerfile and storing the image in AWS ECR.
  - Set up a Jenkins server on AWS EC2 and configure necessary plugins (Docker, Kubernetes, AWS CLI).
  - Configure Jenkins to access EKS and AWS resources using credentials and AWS IAM roles.
  - Set up Git integration for Jenkins to trigger builds based on code changes.
- Goal: Complete the application architecture, Dockerize the application, and establish a Jenkins server for CI/CD.

## Sprint 2: AWS Infrastructure Provisioning with Terraform and Jenkins Integration
- Tasks:
  - Write Terraform scripts for AWS resources: VPC, EKS cluster, subnets, security groups, and EC2 instances.
  - Create a Jenkins job to automate the Terraform infrastructure provisioning process.
  - Test the Terraform job on Jenkins, ensuring that infrastructure is provisioned consistently across environments.
  - Store Terraform state files securely in AWS S3 for consistent multi-user access.
- Goal: Automate AWS infrastructure provisioning through Jenkins and Terraform, enabling reproducible environments.

## Sprint 3: Configuration Management with Ansible and Jenkins Pipeline
- Tasks:
  - Write Ansible playbooks to configure EC2 instances, install Docker, kubectl, and other dependencies.
  - Create a Jenkins pipeline job to run Ansible playbooks for setting up and configuring resources on AWS.
  - Ensure the Ansible job on Jenkins is triggered after the Terraform job completes, creating a seamless flow.
  - Test the Ansible playbooks on infrastructure provisioned by Terraform to validate configurations.
- Goal: Automate configuration management with Ansible through Jenkins, ensuring consistent and reliable server configurations.
 
## Sprint 4: CI/CD Pipeline for Application Deployment on Kubernetes (EKS)
- Tasks:
  - Create a multi-stage Jenkins pipeline for the application, including stages for build, test, and deployment.
  - Build the Docker image in the pipeline and push it to AWS ECR.
  - Use Jenkins to run Kubernetes manifests (Deployment, Service) that deploy the application to EKS.
  - Configure Kubernetes health checks and auto-scaling in the deployment pipeline.
  - Test the end-to-end pipeline from code push to deployment on EKS, ensuring proper functionality.
- Goal: Build a fully automated CI/CD pipeline that deploys the application to Kubernetes on AWS EKS.

 
## Sprint 5: Monitoring Setup with Prometheus, Grafana, and Jenkins Alerts
- Tasks:
  - Install Prometheus in the EKS cluster for monitoring metrics and configure it to collect data from the application and nodes.
  - Set up Grafana to visualize Prometheus metrics and create dashboards for application performance and resource health.
  - Integrate Jenkins with Prometheus/Grafana to monitor job and infrastructure health.
  - Set up alerting rules in Prometheus for critical metrics and configure Jenkins to send notifications for failed deployments or resource issues.
  - Test monitoring and alerting, ensuring visibility into the health of the infrastructure and application.
- Goal: Provide real-time monitoring and alerting using Prometheus, Grafana, and Jenkins notifications for efficient infrastructure management.
 
## Sprint 6: Testing, Documentation, and Final Pipeline Automation
- Tasks:
  - Write test cases to validate application functionality, deployment success, and infrastructure integrity.
  - Document each step in the Jenkins pipeline, Terraform, and Ansible setup, including configuration and troubleshooting.
  - Automate the Jenkins job triggers for each stage of the pipeline (e.g., code change triggers build, build triggers deploy).
  - Conduct final end-to-end testing to verify the stability of the CI/CD pipeline, monitoring, and infrastructure setup.
  - Collect feedback and make adjustments as needed for a production-ready setup.
- Goal: Finalize and document the CI/CD pipeline, testing its readiness for production deployment.
 
# CI/CD Pipeline Stages in Jenkins

## 1. Build Stage: 
   - Triggers when code is pushed to the repository.
   - Builds Docker images for the application and pushes them to AWS ECR.
   
## 2. Infrastructure Provisioning Stage:
   - Runs Terraform scripts to provision infrastructure (VPC, EKS, EC2) on AWS.
   - Stores Terraform state in AWS S3 for persistence and team collaboration.

## 3. Configuration Management Stage:
   - Runs Ansible playbooks to configure EC2 instances and Kubernetes nodes.
   - Installs necessary dependencies and ensures security and access configurations.

## 4. Deployment Stage:
   - Deploys the application to the EKS cluster using Kubernetes manifests.
   - Configures load balancing, auto-scaling, and health checks for resilient deployment.

## 5. Testing and Monitoring Stage:
   - Runs test scripts to validate application functionality post-deployment.
   - Sets up monitoring with Prometheus and Grafana, with alerts configured for real-time notifications.


# Summary of Deliverables by End of Project
- End-to-End Jenkins CI/CD Pipeline: Fully automated pipeline with build, provisioning, configuration, deployment, testing, and monitoring stages.
- Multi-Cloud AWS Infrastructure: Automated infrastructure setup using Terraform, deploying VPC, EKS, EC2, and S3 resources.
- Configuration Management with Ansible: Ansible playbooks to automate server and application configurations on AWS.
- Application Deployment on EKS: Scalable and resilient Kubernetes-based deployment on AWS EKS.
- Monitoring and Alerts: Real-time monitoring with Prometheus and Grafana, with integrated alerts in Jenkins.
- Comprehensive Documentation: Setup guides, usage instructions, and troubleshooting for Terraform, Ansible, Kubernetes, and Jenkins.

Here's a detailed breakdown for the "Multi-Cloud Deployment and Management with Terraform" project. This project aims to help DevOps teams deploy and manage applications across multiple cloud providers, ensuring high availability, cost optimization, and disaster recovery using Infrastructure as Code (IaC) with Terraform.

---

# Sprint 1: Architecture Design, Dockerization, and Jenkins Setup

## Setting-up Jenkins Server
Create EC2 for Jenkins server - The server is t3-medium with 30GB Storage volume Included
<img width="976" height="488" alt="image" src="https://github.com/user-attachments/assets/716f97a7-a3d0-4673-892b-66a18a29edd6" />

SSH to the instance and run *sudo apt update*

<img width="975" height="517" alt="image" src="https://github.com/user-attachments/assets/25e4e1cc-c219-4cd8-a9e3-de31e41fda11" />

Then running *sudo apt install -y openjdk-17-jdk* to install the Java for Jenkins

<img width="975" height="425" alt="image" src="https://github.com/user-attachments/assets/31121ca9-6b81-479a-b0f5-31d00523f302" />

Verify installation    →   *java -version*

<img width="975" height="227" alt="image" src="https://github.com/user-attachments/assets/031016fd-6635-40fa-b15a-fb7ae706b80b" />

Add Jenkins GPG Key   →   *curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null*

Add Jenkins Repository   →  *echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]
https://pkg.jenkins.io/debian-stable binary/ | sudo tee  /etc/apt/sources.list.d/jenkins.list > /dev/null*

<img width="975" height="100" alt="image" src="https://github.com/user-attachments/assets/c3e631fe-e4d7-464e-8e91-18128f39db0a" />

Install Jenkins  →  *sudo apt install -y jenkins*

<img width="975" height="419" alt="image" src="https://github.com/user-attachments/assets/fc7b006e-d674-4675-a0a2-a12bfe924c4f" />

Check the status of Jenkins  → *sudo systemctl status jenkins*

<img width="975" height="529" alt="image" src="https://github.com/user-attachments/assets/848ea818-1bb2-457d-91dc-c6ae3ce30bf0" />

If not enabled run these commands to enable Jenkins and check the status
→   *sudo systemctl enable jenkins*
→   *sudo systemctl start jenkins*

Open your public IP to see the Jenkins running on its default Port number http://<IP-Address>:8080/

<img width="975" height="223" alt="image" src="https://github.com/user-attachments/assets/2a8e08af-ba9a-4d28-8fdd-fc7629145211" />

If the IP address is failed to opening Jenkins server we need to update our security credentials for the Jenkins EC2

<img width="975" height="502" alt="image" src="https://github.com/user-attachments/assets/144aaf30-49a4-41d6-8087-f4d5bcca7741" />

Click on the Security Group under security tab

<img width="975" height="375" alt="image" src="https://github.com/user-attachments/assets/eb9c0ea9-5946-4208-a13b-950a043b8e99" />

Then Edit Inbound rules

<img width="975" height="402" alt="image" src="https://github.com/user-attachments/assets/c16aba34-fb79-4353-9210-c7365d4fee06" />

Then Add rules and save it

<img width="975" height="423" alt="image" src="https://github.com/user-attachments/assets/5bf23e3e-5da6-4956-9af6-32e9bf5594f0" />

Now Jenkins is Loading on the browser with 8080 Port

<img width="975" height="500" alt="image" src="https://github.com/user-attachments/assets/4543fe42-51bd-4bcd-82dd-baf0ca3d5b52" />

Now it asking Administration Password from the path /var/lib/jenkins/secrets/initialAdminPassword  where Jenkins installed

Go to that path and copy the password

<img width="975" height="204" alt="image" src="https://github.com/user-attachments/assets/f319cb0e-dec0-4a40-abad-90e789814bce" />


Then past it here in the Jenkins server and click continue

<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/fe7926c6-112c-4a3a-ad3c-e93b817eccd4" />



Click Install suggested plugin

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/93218a1c-76cb-4e52-a71d-f2f1d2405cc1" />
<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/ac5c3994-0741-4fdd-b231-0557e8d4729d" />

Enter required information here
<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/34473be4-a79f-4ef4-8cff-d7a10abfe9c3" />

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/49913b66-0ac0-4b1e-b3e7-1ca738442d32" />

Click Start Using Jenkins

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/f2977744-41a5-4e69-89cc-8d966f0c11cb" />

We can see the Home page of Jenkins

<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/b0f40b1b-b16e-4d28-87bd-1d2d11768aeb" />

## Setting up Git integration for Jenkins to trigger builds based on code changes

Go to Github repository that we want to use in the Jenkins

<img width="975" height="290" alt="image" src="https://github.com/user-attachments/assets/0536f786-0d41-4033-a4e5-66fbbe41bf37" />

Go to settings  →  webhooks → Click Add Webhook

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/718b50fa-bfa9-4a8e-bd84-cc247b6b5313" />

Add payload url and select application/Json in the content type then click add Webhook

The default payload for Jenkins → *http://<PUBLIC-IP-or-DNS>:8080/github-webhook/*

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/433594b5-3051-44f3-823c-2c6dfa58fc8c" />

<img width="975" height="208" alt="image" src="https://github.com/user-attachments/assets/ef268b65-69e2-4b5d-a721-1e747665768d" />

## Configure the Jenkins EC2 server and the required plugin in Jenkins
1.	Git
2.	Awscli
3.	Eksctl
4.	Kubectl
5.	Docker
6.	Terraform 
7.	Helm

## 1. Git Installation

After running → *sudo apt update to Install Git  →  sudo apt install -y git  →  git --version*

<img width="975" height="500" alt="image" src="https://github.com/user-attachments/assets/0b7ebf11-28ce-4a3f-95af-41de7cd5c929" />


## 2. Aws CLI v2 Installation

After running →  *sudo apt install unzip 
Run →  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
 →  unzip awscliv2.zip
 →  sudo ./aws/install
 →  aws --version*

<img width="975" height="348" alt="image" src="https://github.com/user-attachments/assets/ddee2633-a7dd-4bbb-b592-fbe65d882b25" />

<img width="975" height="100" alt="image" src="https://github.com/user-attachments/assets/e4eec19d-26a7-445a-b798-47c43eed30f6" />

## 3. Kubectl Installation

 →  *curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
 →  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
 →  kubectl version --client*

<img width="975" height="238" alt="image" src="https://github.com/user-attachments/assets/3d0e5dfe-3265-4330-a05a-1e8a0c6102ff" />


## 4. Eksctl Installation

 →  *curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz
 →  sudo mv eksctl /usr/local/bin
 →  eksctl version*

<img width="975" height="190" alt="image" src="https://github.com/user-attachments/assets/7d5b1bb9-ef97-4b45-b5f6-6ddf605ae673" />

## 5. Docker Installation

 →  *sudo apt install -y ca-certificates curl gnupg lsb-release*

Add Docker GPG key
 →  *sudo mkdir -p /etc/apt/keyrings
 →  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg*

Add Docker repo
 →  *echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 →  sudo apt update
 →  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin*

Add user to docker group
 →  *sudo usermod -aG docker $USER
 →  newgrp docker
 →  docker --version*

<img width="975" height="175" alt="image" src="https://github.com/user-attachments/assets/d4c440ec-8517-4da9-8af8-9a609827cd12" />

## 6. Terraform Installation

 → *curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
 →  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
 →  sudo apt update
 →  sudo apt install -y terraform
 →  terraform version*

<img width="975" height="127" alt="image" src="https://github.com/user-attachments/assets/4c385c98-84a7-4133-8c7b-1c8ed6c357f7" />

## 7. Helm Installation

Official helm script
 → *curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash*

Manual download and installation
 →  *curl -LO https://get.helm.sh/helm-v3.12.0-linux-amd64.tar.gz
 →  tar -zxvf helm-v3.12.0-linux-amd64.tar.gz
 →  sudo mv linux-amd64/helm /usr/local/bin/helm
 →  rm -rf linux-amd64 helm-v3.12.0-linux-amd64.tar.gz
 →  helm version*

## Verify installation once again
 →  *git --version
 →  aws --version
 →  eksctl version
 →  kubectl version --client
 →  docker --version
 →  terraform version
 →  helm version*
 
<img width="975" height="354" alt="image" src="https://github.com/user-attachments/assets/a1bd55c1-6ede-404e-91f6-ce5d394c5950" />


## Add IAM Policies for the Jenkins EC2 server to Access EKS, ECR, EBS, S3, IAM and CloudWatch

We see that no IAM is being attached here

<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/90927f19-f557-492a-8c6e-43ed8ab6902d" />

Modify the IAM for this Jenkins server - Go to Action and Select Modify IAM role under Security

<img width="975" height="298" alt="image" src="https://github.com/user-attachments/assets/eb6fef27-fe96-49ae-bdef-5580f919f9ef" />

Click Create New IAM role

<img width="975" height="296" alt="image" src="https://github.com/user-attachments/assets/3eb1230e-58e7-48e8-bf16-155432359bc0" />

Click Create Role

<img width="975" height="329" alt="image" src="https://github.com/user-attachments/assets/611d1c53-d801-413a-9f18-2053184997dc" />

<img width="975" height="404" alt="image" src="https://github.com/user-attachments/assets/63c6ed08-7c81-4e74-aaa8-54c796d244e2" />

Select the policies that you want to add it in the IAM role for the Jenkins Server

<img width="975" height="385" alt="image" src="https://github.com/user-attachments/assets/0a3aff3f-57b5-47f0-a8b1-6f443a973bd7" />

Give a name and click create role

<img width="975" height="410" alt="image" src="https://github.com/user-attachments/assets/15348b05-d1b0-4c1e-ac30-bc78df8712c0" />

<img width="975" height="396" alt="image" src="https://github.com/user-attachments/assets/97479a1f-b1c8-4926-a043-31db60c9873d" />

<img width="975" height="425" alt="image" src="https://github.com/user-attachments/assets/8308efe8-f455-46d5-933c-fb8229e356de" />

Now attach this role to the Jenkins server

Select new IAM Role

<img width="975" height="256" alt="image" src="https://github.com/user-attachments/assets/53b89775-32bd-4181-8d0d-514e4e17fdf0" />

And click Update IAM role

<img width="975" height="244" alt="image" src="https://github.com/user-attachments/assets/4c61b3ba-a131-4d7f-bc2d-675256be2c60" />

<img width="975" height="300" alt="image" src="https://github.com/user-attachments/assets/3c2e8da8-0795-4196-9904-c8f0b22d6306" />

Run  →  *aws sts get-caller-identity*  to verify the role being successfully added

<img width="975" height="242" alt="image" src="https://github.com/user-attachments/assets/c97eeb3e-9322-4121-a5b0-ad5d595dc36c" />

Also Configure AWS CLI to connect with aws  →  *aws configure*

<img width="975" height="148" alt="image" src="https://github.com/user-attachments/assets/593accb5-5f80-4e61-9544-3f07ca92f81a" />

Check you can access the aws resource  →  *aws list-clusters --region eu-west-2*

<img width="975" height="204" alt="image" src="https://github.com/user-attachments/assets/3c000f36-1eb3-431e-903f-186901f7d0b8" />

## Add all required plugin to Jenkins →  Go to Jenkins settings and click Plugins

<img width="975" height="409" alt="image" src="https://github.com/user-attachments/assets/6d8d1c21-539c-4a8b-8675-57ed60402483" />

Select your plugin under Available Plugins and click Install

<img width="975" height="418" alt="image" src="https://github.com/user-attachments/assets/8c7530c9-f265-4bfc-8210-658c6a9f040e" />

<img width="975" height="423" alt="image" src="https://github.com/user-attachments/assets/3ab15c30-8df9-4450-b8e0-bc3aec8748d5" />

Check the App Locally before building the Docker Image
<img width="975" height="519" alt="image" src="https://github.com/user-attachments/assets/89298199-029a-46c0-9d38-69d2606ca07e" />

<img width="975" height="517" alt="image" src="https://github.com/user-attachments/assets/787e84ab-1e9b-44ef-b70f-09a40df229ef" />

<img width="975" height="519" alt="image" src="https://github.com/user-attachments/assets/3197caa3-e6d9-44be-9165-d7599ad35f3c" />

<img width="975" height="519" alt="image" src="https://github.com/user-attachments/assets/d020c64e-bb45-4225-968c-80b3e3f4871f" />

<img width="975" height="519" alt="image" src="https://github.com/user-attachments/assets/6e970ceb-3d44-4197-b908-0ed75ae545ae" />

Start the Docker Engine and build the images

<img width="975" height="533" alt="image" src="https://github.com/user-attachments/assets/bf71bbc2-79ae-498f-ac6a-cd5659da6a29" />

 Build images   
 →    *docker build -t shopnow-backend:latest .
 →    docker build -t shopnow-frontend:latest .
 →    docker build -t shopnow-admin:latest .*

 <img width="975" height="423" alt="image" src="https://github.com/user-attachments/assets/b18353b9-daea-49a7-a648-cda65748e33a" />

<img width="975" height="331" alt="image" src="https://github.com/user-attachments/assets/65dcec58-f2b7-4be0-b146-78ae0ac59d59" />

## Create ECR Repositories for each services and Tag images for pushing to its respective repos


Creating repository and tag image
  →  *aws ecr create-repository --repository-name sam-shopnow-frontend --region eu-west-2
  →  docker tag shopnow-frontend:latest 975050024946.dkr.ecr.eu-west-2.amazonaws.com/sam-shopnow-frontend:latest*


<img width="975" height="477" alt="image" src="https://github.com/user-attachments/assets/74e83f79-8e3d-4f6e-9dbc-19fae774828c" />

## Make sure Logged in between Docker and AWS

 →  aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 975050024946.dkr.ecr.eu-west-2.amazonaws.com  

<img width="975" height="285" alt="image" src="https://github.com/user-attachments/assets/9ec89724-e741-419e-adda-ec41f1e1fbbf" />

Push the Images and verify in the AWS ECR in console
  →  *docker push 975050024946.dkr.ecr.eu-west-2.amazonaws.com/sam-shopnow-backend:latest*

<img width="975" height="394" alt="image" src="https://github.com/user-attachments/assets/b90446aa-378f-4d7e-8f18-ac819f002901" />

<img width="975" height="292" alt="image" src="https://github.com/user-attachments/assets/4cc24680-65c0-44a2-973a-786ae7eaf0aa" />

---
# Sprint 2: AWS Infrastructure Provisioning with Terraform and Jenkins Integration

## Create Terraform folders and .tf files for creating VPC and EKS 
Run    →  *terraform init*
<img width="975" height="354" alt="image" src="https://github.com/user-attachments/assets/c59d1ef5-3988-4a37-b221-bcc19d9c1f5a" />

Make sure you created a bucket for state file to be stored and mentioned this bucket name in the backend in providers
<img width="975" height="431" alt="image" src="https://github.com/user-attachments/assets/b66e5aae-608f-4fba-8fb5-2a5f2793cf73" />

<img width="975" height="144" alt="image" src="https://github.com/user-attachments/assets/70b07c03-0393-45dd-802d-80ade77ad461" />

Run  →  *terraform validate* to check all the terraform code
<img width="975" height="169" alt="image" src="https://github.com/user-attachments/assets/b37b1c7f-095b-4373-8ea6-cafff452a7c9" />

  →  *terraform plan --var-file=prod.tfvars*  to see the final plan that will be executed
<img width="975" height="488" alt="image" src="https://github.com/user-attachments/assets/0b605beb-763d-4c79-b7d8-6711e707d2f6" />

Now in Jenkins Click the New Items to select pipeline option
<img width="975" height="290" alt="image" src="https://github.com/user-attachments/assets/38ebee9d-91e9-429b-9791-ee081354b06f" />

Give a Name and select Pipeline and click *ok* 

<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/73c557f3-6f78-4cec-a8df-5254e206af2b" />


In the opened settings, select trigger as SCM Poling, and then Under *SCM* select *Git*
<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/bdb068d8-0f06-4acb-9963-04094e18f7a0" />

Then Click *Save*

Provide git link and set branch
<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/b224bae1-b524-4e8e-a91c-f18437c815b5" />
<img width="975" height="283" alt="image" src="https://github.com/user-attachments/assets/2b9a673d-2292-4122-a24b-05a6478e402e" />

Create secret credentials in Jenkins 
Settings → Credentials → Kind: AWS Credentials → Provide all the details and click create
<img width="975" height="485" alt="image" src="https://github.com/user-attachments/assets/cf215c26-06d8-40d2-9a09-3e0743b641a0" />

## The pipeline is ready on the webhook trigger to pull code and run the Jenkinsfile and create resources using Terraform scripts.

Create *Jenkinsfile* for the terraform infrastructure provisioning and push the code for triggering the pipeline
<img width="975" height="502" alt="image" src="https://github.com/user-attachments/assets/de40ce6f-9775-479f-9138-bea7791ff786" />

<img width="975" height="288" alt="image" src="https://github.com/user-attachments/assets/3ea27f53-82a2-46d9-bac5-46fa645ca0e2" />


## Pipeline is triggered and build success in creating aws resources by executing terraform
<img width="975" height="443" alt="image" src="https://github.com/user-attachments/assets/c1430fc3-bb85-4e13-9bf2-448bfe722e76" />

<img width="975" height="421" alt="image" src="https://github.com/user-attachments/assets/c641398f-1c39-4900-b49f-b4e623845cdc" />

<img width="975" height="277" alt="image" src="https://github.com/user-attachments/assets/e9ae5892-0d24-4e5d-89f5-4b403bfb78e8" />

But resources not created, lets debug the code in Jenkinsfile to work correctly
After a Debugging code - push it to the repo to trigger the pipeline

<img width="975" height="344" alt="image" src="https://github.com/user-attachments/assets/32ea3cab-edda-460c-af5a-a2738914189e" />
<img width="975" height="492" alt="image" src="https://github.com/user-attachments/assets/1faf1e06-a5a6-4e10-b559-7ed1e8341fa5" />

We can see that resources are created
<img width="975" height="200" alt="image" src="https://github.com/user-attachments/assets/76392503-3db5-4d1b-8b9e-d13295944256" />
<img width="975" height="235" alt="image" src="https://github.com/user-attachments/assets/fc689804-2914-4409-a909-c168581d3eaf" />

After the resources created we can destroy them now for full project automation
Add and Run *terraform destroy* in the Jenkins pipeline to destroy the resources by passing parameters in pipeline code (Optional)
<img width="975" height="202" alt="image" src="https://github.com/user-attachments/assets/3d13d939-7b1a-4225-b355-7e3c545b2d80" />

Terraform destroyed all the resources that were created before using terraform apply
<img width="975" height="450" alt="image" src="https://github.com/user-attachments/assets/0d371dbd-28ad-45b5-944d-28e69530451c" />

EKS cluster and VPC deleted
<img width="975" height="252" alt="image" src="https://github.com/user-attachments/assets/07f9ab75-8cc8-45e7-8dfe-635f6fe3e711" />
<img width="975" height="229" alt="image" src="https://github.com/user-attachments/assets/b99f0816-f44e-4182-9683-8e7ca7611747" />

---

# Sprint 3: Configuration Management with Ansible and Jenkins Pipeline

## Create ansible playbook and update the Jenkins file to create resources and ansible to install tools in New EC2 instance

*playbook.yml*
<img width="975" height="504" alt="image" src="https://github.com/user-attachments/assets/da18da56-e3ca-459a-91a3-1e58fc62849a" />

Jinkins file → This Jenkinsfile creates an inventory file on the runtime and takes the IP of the new EC2 instance from terraform output.tf and installs tools by doing ssh in to it.

<img width="975" height="450" alt="image" src="https://github.com/user-attachments/assets/4652824a-7753-4d12-8f02-30df6b28a3fe" />

## After pushing the code to the repo the pipeline executes and runs the scripts and pipeline is successful. Let’s cross verify the resources that are created in the AWS Management Console

<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/13d3e382-ba86-4503-973a-865b337e383e" />

<img width="975" height="323" alt="image" src="https://github.com/user-attachments/assets/fac50558-d8f6-4492-86d1-e72093b97964" />
<img width="975" height="246" alt="image" src="https://github.com/user-attachments/assets/6b38e569-5d12-40b2-8bdc-e823f25450d8" />

New EC2 also created 

<img width="975" height="283" alt="image" src="https://github.com/user-attachments/assets/06a676e4-4148-4ecf-b85b-06fa8ad9f508" />
<img width="975" height="133" alt="image" src="https://github.com/user-attachments/assets/35781bad-f80d-42f9-b640-e02522f52dca" />

Lerts shh in to the EC2 and verify whether ansible installed tools or not
<img width="975" height="285" alt="image" src="https://github.com/user-attachments/assets/443c2f70-a08f-491e-9b8f-b64222e891b5" />
## Successfully Installed tools using Ansible

---

# Sprint 4: CI/CD Pipeline for Application Deployment on Kubernetes (EKS)

Creating Frontend Jenkins Pipeline
<img width="975" height="502" alt="image" src="https://github.com/user-attachments/assets/f5d31c99-c74c-40a5-8dc7-fd5f35c49be8" />

Creating Backend Jenkins Pipeline
<img width="975" height="521" alt="image" src="https://github.com/user-attachments/assets/e1b25545-cd5c-418e-8175-ccdc6d9eeda1" />

Creating Admin Jenkins Pipeline
<img width="975" height="519" alt="image" src="https://github.com/user-attachments/assets/afa82d87-64f5-4330-bb96-a182c41140a7" />

## Create each pipeline separately
<img width="1919" height="982" alt="image" src="https://github.com/user-attachments/assets/0d679656-3814-4fc3-a55b-f2f0a7043691" />

Running Each Pipeline Including Terraform and Ansible in it 
<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/56f17127-0f8e-4714-b601-5277f18b769d" />

Backend Pipeline
<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/29df430a-c88f-45d7-b218-1a9fde1a58b2" />

Frontend Pipline
<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/7a361946-ae65-4e53-b9e5-46379ddaf166" />

Admin Pipeline
<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/f897e246-a293-4c01-8669-1c97003f6a48" />

## Pods are running successfully In EKS
<img width="975" height="485" alt="image" src="https://github.com/user-attachments/assets/82c2829a-e8aa-4f68-8a8c-98eb9b22585b" />

Lets accessing by port forwarding them 

Frontend UI with correct URL
<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/94d2a6ea-c840-4c17-8bd9-819156146f25" />
<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/852df66a-8e94-499f-b03c-6e195bcea4e8" />
<img width="975" height="500" alt="image" src="https://github.com/user-attachments/assets/4ac9b98d-ec39-46d6-88b1-b6d91e3d6484" />
<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/b8620890-7d43-42bc-8181-a216c1725445" />

Admin UI with Correct URL
<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/66cfdb90-b7ad-44c4-b9ba-d384c3bfdd31" />

---

# Sprint 5: Monitoring Setup with Prometheus, Grafana, and Jenkins Alerts
## Install Prometheus & Grafana in EKS
→ Run this to get the source file to install
*helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update*

→ Install Prometheus and Grafana in EKS via helm
*helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
--namespace monitoring \
--create-namespace*

→ Check installed and running pods
*kubectl get pods -n monitoring*

→ get the secret with base64 encoded for logging in to the grafana 
*kubectl get secret monitoring-grafana \
-n monitoring \
-o jsonpath="{.data.admin-password}" | base64 --decode*

<img width="985" height="386" alt="image" src="https://github.com/user-attachments/assets/99b23307-f012-4bde-93f2-951b543a6445" />

<img width="923" height="439" alt="image" src="https://github.com/user-attachments/assets/81428795-8fd3-456f-ae78-1f6f6abb8e77" />

Login by Opening your Ec2 instance with :3000 use the secret that you get in the previous command

<img width="975" height="450" alt="image" src="https://github.com/user-attachments/assets/cca20c83-a290-4f7d-8426-0197a03d8b14" />

<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/478ef745-1123-41f6-8d7c-3f6dc6d02992" />

Go to Data source under connection tab in menu and click Prometheus

<img width="975" height="492" alt="image" src="https://github.com/user-attachments/assets/c863880c-1796-469b-be6a-be263cc927d8" />

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/64ecfa79-fcb8-4c47-b305-1b69093ea386" />

Scroll down and click test 

<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/5e0af904-0220-4572-9db0-13909a7e6284" />

<img width="975" height="285" alt="image" src="https://github.com/user-attachments/assets/1f06f0b9-7370-4aa4-902d-9801ca4a01a0" />

Next Go to Dashboard click New dropdown → Import and start adding dashboards to see the metrics

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/b33e60d8-975c-4e94-8996-6161e4704c18" />

<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/c713439a-c977-4e8c-8d01-8a6fd943716c" />

We have to add dashboard here, click that *grafana.com/dashboards* to see available dashboard

Search for Dashboard → Kubernetes Cluster Monitoring (Via Prometheus)

<img width="975" height="494" alt="image" src="https://github.com/user-attachments/assets/0231e7b1-9d5e-4cf5-988c-f7c72b20b1f1" />

<img width="975" height="500" alt="image" src="https://github.com/user-attachments/assets/98b7087d-2752-4fde-8704-b29c38c3c827" />

Scroll down and you can see the ID number → ID 3119

<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/f5dcf30e-7e44-46fb-ac1c-99b83fb26c63" />

Come back to the Import and enter the ID here and click Load and select the Dashboard to import

<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/6f8f6262-68f7-4c6b-b2aa-d4b1edb79a57" />

Scroll down and Select the Data source here and Import

<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/726628e1-5966-403b-b2b2-00fd610a7063" />

## Now we can see the dashboard added and can see the metrics

<img width="975" height="500" alt="image" src="https://github.com/user-attachments/assets/0f9032f5-7c7c-48db-866f-981c490adf49" />

<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/b282d371-6f19-4490-96d8-09006632d839" />

<img width="975" height="492" alt="image" src="https://github.com/user-attachments/assets/c09129e9-6cef-4dd6-9509-0030e3c3d662" />

Import more dashboard for more metrics

<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/0b2f80c5-e02c-4f01-984e-2e85a7888989" />

<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/e966fb1a-64ea-4de7-b433-8a2104806ad0" />

<img width="975" height="525" alt="image" src="https://github.com/user-attachments/assets/be2af1f4-22f1-4cec-a062-2a36205296e9" />

<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/1cc0c4c5-3fcf-48a7-8ef5-c3b549336475" />

## Let’s Verify that we are actually receiving Realtime data by Querying using Explore menu

<img width="975" height="496" alt="image" src="https://github.com/user-attachments/assets/7cb72e94-30da-47bd-b90d-0640f9f26223" />

We can see data fetched in real time

<img width="975" height="500" alt="image" src="https://github.com/user-attachments/assets/e3307732-1b8c-4f41-92f6-ae7b2be70ecd" />

One more query to check Pods

<img width="975" height="498" alt="image" src="https://github.com/user-attachments/assets/fa50ad64-dc7c-4072-8c16-6b7df2445b73" />

## We can see the pods and name space

<img width="975" height="490" alt="image" src="https://github.com/user-attachments/assets/7d650394-5cb9-40e7-ba39-d8dcbc3455e3" />

---

We have achieved deploying the application on EKS in the compleate End-to-End CI/CD Pipline include using Terrafomr and Ansible
•	End-to-End Jenkins CI/CD Pipeline: Fully automated pipeline with build, provisioning, configuration, deployment, testing, and monitoring stages.
•	Multi-Cloud AWS Infrastructure: Automated infrastructure setup using Terraform, deploying VPC, EKS, EC2, and S3 resources.
•	Configuration Management with Ansible: Ansible playbooks to automate server and application configurations on AWS.
•	Application Deployment on EKS: Scalable and resilient Kubernetes-based deployment on AWS EKS.
•	Monitoring and Alerts: Real-time monitoring with Prometheus and Grafana, with integrated alerts in Jenkins.
•	Comprehensive Documentation: Setup guides, usage instructions, and troubleshooting for Terraform, Ansible, Kubernetes, and Jenkins.

---

Documentation by: Sam Donald A
Email: samdonaldand@gmail.com
GitHub: https://github.com/SamDonald-A
Website: www.samdonald.in

---

# 🛒 ShopNow E-Commerce - Kubernetes Learning Project

ShopNow is a **Kubernetes learning project** built around a full-stack MERN e-commerce application:
- **Customer App** (React frontend)  
- **Admin Dashboard** (React admin panel)  
- **Backend API** (Express + MongoDB)  

This project teaches **Kubernetes** from container basics to production-ready deployments with Dockerfiles, Kubernetes manifests, Helm, GitOps and CICD using Jenkins.

## 🎯 Learning Objectives
- Write Dockerfiles for containerising the application
- Master Kubernetes fundamentals through hands-on practice
- Understand and implement HELM Chart for application deployment on kubernetes
- Implement GitOps workflows using ArgoCD
- Implement CICD pipelines using Jenkins

---

## 📁 Project Structure

```
shopNow/
├── backend/               # Node.js API server
├── frontend/              # React customer app
├── admin/                 # React admin dashboard
├── kubernetes
│   ├── k8s-manifests/     # Raw Kubernetes YAML files
│   ├── helm/              # Helm charts for package management
│   │   └── charts/        # Individual charts
│   ├── argocd/            # GitOps deployment configs
│   └── pre-req/           # Cluster prerequisites
├── jenkins/               # Pipeline definitions (CI & CD)       
├── docs/                  # learning resources and guides
└── scripts/               # Automation and utility scripts
```

---

## 🚀 Learning Journey

### Container & Kubernetes Basics
1. **Start Here**: [docs/K8S-CONCEPTS.md](docs/K8S-CONCEPTS.md) - Core concepts explained
2. **Raw Kubernetes Manifests**: `kubernetes/k8s-manifests/`

### Package Management & Automation  
3. **Helm Charts**: `kubernetes/helm/`
4. **CI/CD Pipelines**: `jenkins/`

### GitOps & Production Readiness
5. **ArgoCD GitOps**: `kubernetes/argocd/`


## Getting Started

## 🛠 Prerequisites & Setup

#### 1. Setup Tools**: [docs/TOOLS-SETUP-GUIDE.md](docs/TOOLS-SETUP-GUIDE.md)

#### 2. AWS ECR Registry Setup 
```bash
# Setup AWS credentials first
aws configure
# Enter your AWS Access Key ID, Secret Access Key, region (us-east-1), and output format (json)

# Or use environment variables
export AWS_ACCESS_KEY_ID=your-access-key
export AWS_SECRET_ACCESS_KEY=your-secret-key
export AWS_DEFAULT_REGION=us-east-1

# If above credentials are already set, run below command to verify
aws sts get-caller-identity

# Create ECR repositories either via the aws cli as mentioned below or via console (Has to be done once to create the ECR repo, skip this step when you are rebuilding the docker images):

like:

aws ecr create-repository --repository-name <your-username>-shopnow/frontend --region <region>
aws ecr create-repository --repository-name <your-username>-shopnow/backend --region <region>
aws ecr create-repository --repository-name <your-username>-shopnow/admin --region <region>

# Get login token (run this command everytime as the docker credentials are persisted only on the terminal)
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
```


#### 3. Update Configurations in below mentioned files


## 🔧 Personalization Required

**For Multi-User Kubernetes Clusters**: To avoid conflicts when multiple learners use the same cluster, each user must personalize their deployment with unique identifiers.

**IMPORTANT**: This project contains hardcoded references that you must update with your own values:

3.1. Replace "aryan" with your username in these locations:

  **Ingress Paths** (in both Kubernetes manifests and Helm charts):
   - `kubernetes/k8s-manifests/ingress/ingress-shopnow.yaml`
     - Change `/aryan` to `/<your-username>`
     - Change `/aryan-admin` to `/<your-username>-admin`
   
   - `kubernetes/helm/charts/frontend/values.yaml`
     - Change `path: /aryan` to `path: /<your-username>`
   
   - `kubernetes/helm/charts/admin/values.yaml`
     - Change `path: /aryan-admin` to `path: /<your-username>-admin`


  **Nginx ConfigMaps**
   - All references with 'aryan' to <your-username> in following files:
   - `kubernetes/k8s-manifests/frontend/cm-nginx.yaml`   
   - `kubernetes/k8s-manifests/admin/cm-nginx.yaml`


  **Helm Chart Nginx Configurations**:
   - All references with 'aryan' in the 'nginx.config' section to <your-username> in following files:
   - `kubernetes/helm/charts/frontend/values.yaml` 
   - `kubernetes/helm/charts/admin/values.yaml`

  **Dockerfiles** (Build Arguments):
   - `frontend/Dockerfile`
     - Change `ARG USER_NAME=aryan` to `ARG USER_NAME=<your-username>`
   
   - `admin/Dockerfile`
     - Change `ARG USER_NAME=aryan` to `ARG USER_NAME=<your-username>`

  **Build Script** (optional):
   - `scripts/build-and-push.sh`
     - Update the example usage comments that reference "aryan"

3.2. **ECR Repository Names** - Update to your username:
   - All `kubernetes/k8s-manifests/*/deployment.yaml` files
   - All `kubernetes/helm/charts/*/values.yaml` files
   - All `jenkins\Jenkinsfile.*.*` files
   - Change `shopnow/frontend` to `<your-username>-shopnow/frontend`
   - Change `shopnow/backend` to `<your-username>-shopnow/backend`
   - Change `shopnow/admin` to `<your-username>-shopnow/admin`

3.3. **Update Namespace** on these locations:
  - `kubernetes/k8s-manifests/namespace/namespace.yaml` - Change namespace name
  - All files in `kubernetes/k8s-manifests/*/` - Update namespace references
  - `kubernetes/argocd/apps/*.yaml` - Update destination namespace
  - All kubectl commands in this README - Replace `shopnow-demo` with your namespace

3.4. **Update ArgoCD Repository URL**:
  - In `kubernetes/argocd/umbrella-application.yaml` and all `kubernetes/argocd/apps/*.yaml` files:
  - Change `repoURL: 'https://github.com/aryanm12/shopNow'` 
  - To `repoURL: 'https://github.com/<your-github-username>/<your-repo-name>'`



#### 4. Kubernetes Cluster Access (Make sure to have a running Kubernetes cluster, here is an example to connect with EKS)
```bash
# For EKS cluster
aws eks update-kubeconfig --region <region> --name <your-cluster-name>

# Verify access
kubectl cluster-info
kubectl get nodes
```

Note: All the below mentioned kubectl commands assume that you are working with "shopnow-demo" namespace, update the namespace as per yours where ever you find "shopnow-demo".

#### 5. Docker Registry Secret (Only required for private ECR registry)
**Note**: Skip this step if using public Docker Hub images or public ECR repositories.

```bash
# Create registry secret for private ECR image pulls
kubectl create ns shopnow-demo
kubectl create secret docker-registry ecr-secret --docker-server=<account-id>.dkr.ecr.us-east-1.amazonaws.com --docker-username=AWS --docker-password=$(aws ecr get-login-password --region us-east-1) --namespace=shopnow-demo
```

#### 6. Install Pre-requisites in the Kubernetes Environment (Has to be done once per Kubernetes Cluster)
```bash
# Install metrics server (required for resource monitoring and HPA)
kubectl apply -f kubernetes/pre-req/metrics-server.yaml

# Install ingress-nginx controller (for external access)
# For EKS, other cloud provider will have different file
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.0-beta.0/deploy/static/provider/aws/deploy.yaml

# For local development (minikube/kind/Docker Desktop)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.1/deploy/static/provider/kind/deploy.yaml

# Verify installations
kubectl get pods -n kube-system
kubectl get pods -n ingress-nginx
kubectl top nodes  # Should work after metrics server is running
kubectl top pods  # Should work after metrics server is running

# To enable Persistent Storage

# First install the EBS CSI driver as an EKS Addon

-> In the EKS Console, open your cluster → go to Add-ons → click Get more add-ons → select Amazon EBS CSI driver → click Next.
-> On the configuration page, Under Pod identity association, choose Create a new IAM role, and the console will auto-attach the AmazonEBSCSIDriverPolicy.
-> Confirm and click Create. The add-on installs, the IAM role is associated with the SA via Pod Identity, and the driver starts running.
-> Verify under Add-ons tab that the EBS CSI driver is active and under Pod identity associations tab you see the SA <-> IAM role mapping.

# Install storage class for persistent volumes
kubectl apply -f kubernetes/pre-req/storageclass-gp3.yaml

# Verify storage class installation
kubectl get storageclass


```


## ⚡ Build and Deploy the micro-services

### 1. Build the docker images and push it to the ECR registry created above

```bash
scripts/build-and-push.sh <account-id>.dkr.ecr.<region>.amazonaws.com/<registry-name> <tag-name-number> <your-username> 

# Example for user 'aryan' with tag 'latest' and ECR registry '975050024946.dkr.ecr.ap-southeast-1.amazonaws.com/shopnow':
./scripts/build-and-push.sh 975050024946.dkr.ecr.ap-southeast-1.amazonaws.com/shopnow latest aryan


```

### 2. Choose Your Deployment Method

**Option A: Raw Kubernetes Manifests**
```bash
kubectl apply -f kubernetes/k8s-manifests/namespace/
kubectl apply -f kubernetes/k8s-manifests/database/
kubectl apply -f kubernetes/k8s-manifests/backend/
kubectl apply -f kubernetes/k8s-manifests/frontend/
kubectl apply -f kubernetes/k8s-manifests/admin/
kubectl apply -f kubernetes/k8s-manifests/ingress/
kubectl apply -f kubernetes/k8s-manifests/daemonsets-example/
```

**Option B: Helm Charts**

```bash
helm upgrade --install mongo kubernetes/helm/charts/mongo -n shopnow-demo --create-namespace
helm upgrade --install backend kubernetes/helm/charts/backend -n shopnow-demo
helm upgrade --install frontend kubernetes/helm/charts/frontend -n shopnow-demo
helm upgrade --install admin kubernetes/helm/charts/admin -n shopnow-demo
```

**Option C: ArgoCD GitOps**
```bash
# Install ArgoCD first
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Create target namespace
kubectl create namespace shopnow-demo

# Deploy applications
kubectl apply -f kubernetes/argocd/umbrella-application.yaml

# Check all ArgoCD application status:
kubectl get applications -n argocd

```

### 3. Create users in MongoDB after the mongodb pods are healthy

```bash

# check the status of the mongo-0 pods 
kubectl get pods -n shopnow-demo

# if mongo-0 pod is healthy, then run following command to create a user for the backend to connect
# user credentials should be same as mentioned in the backend secrets-db.yaml file
# First exex into the pods
kubectl -n shopnow-demo exec -it mongo-0 -- mongosh

# Run below commands
use admin;
db.createUser({
  user: 'shopuser',
  pwd: 'ShopNowPass123',
  roles: [
    { role: 'readWrite', db: 'shopnow' },
    { role: 'dbAdmin', db: 'shopnow' }
  ]
});

exit

# Restart backend deployment
kubectl rollout restart deploy backend -n shopnow-demo
```

### 3. Check the resources deployed

```bash
# Check Pods
kubectl get pods -n shopnow-demo

# Check Deployment
kubectl get deploy -n shopnow-demo

# Check Services
kubectl get svc -n shopnow-demo

# Check daemonsets
kubectl get daemonsets -n shopnow-demo

# Check statefulsets
kubectl get statefulsets -n shopnow-demo

# Check HPA
kubectl get hpa -n shopnow-demo

# Check all of the above at once
kubectl get all -n shopnow-demo

# Check configmaps
kubectl get cm -n shopnow-demo

# Check secrets
kubectl get secrets -n shopnow-demo

# Check ingress
kubectl get ing -n shopnow-demo

# Sequence to debug in case of any issue with the pods
kubectl get pods -n shopnow-demo
kubectl describe pod backend-746cc99cd-cqrgf -n shopnow-demo # Assuming that pod backend-746cc99cd-cqrgf has an error
kubectl logs backend-746cc99cd-cqrgf -n shopnow-demo --previous # If no details are found in the above command or if details like liveness probe failed are coming

```


---

## 🌐 Access the Apps

* **Customer App** → [http://<load-balancer-ip-or-dns>/<your-username>](http://<load-balancer-ip-or-dns>/<your-username>)
* **Admin Dashboard** → [http://<load-balancer-ip-or-dns>/<your-username>-admin](http://<load-balancer-ip-or-dns>/<your-username>-admin)

---

## Additional Notes

**Check the Application Architecture details**: [docs/APPLICATION-ARCHITECTURE.md](docs/APPLICATION-ARCHITECTURE.md)
**Check the Troubleshooting Guide**: [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
---

## 👨‍💻 Author

## K Mohan Krishna

---

