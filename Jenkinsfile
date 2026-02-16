pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION        = "eu-west-3"
        TFVARS_FILE               = "prod.tfvars"
        TERRAFORM_DIR             = "shopnow-infra"
        ANSIBLE_DIR               = "ansible"
        ANSIBLE_HOST_KEY_CHECKING = "False"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir(env.TERRAFORM_DIR) {
                    sh 'terraform init -upgrade'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir(env.TERRAFORM_DIR) {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir(env.TERRAFORM_DIR) {
                    sh "terraform plan -var-file=${TFVARS_FILE} -out=tfplan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir(env.TERRAFORM_DIR) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Generate Ansible Files') {
            steps {
                dir(env.TERRAFORM_DIR) {
                    script {

                        def publicIp = sh(
                            script: "terraform output -raw public_ip",
                            returnStdout: true
                        ).trim()

                        echo "Terraform returned Public IP: ${publicIp}"

                        // 🚨 STOP PIPELINE if IP is empty
                        if (!publicIp) {
                            error("Terraform did not return a public IP. Stopping pipeline.")
                        }

                        sh """
                        mkdir -p ../${ANSIBLE_DIR}

                        cat <<EOF > ../${ANSIBLE_DIR}/inventory.ini
[Ubuntu_Servers]
${publicIp}
EOF

                        cat <<EOF > ../${ANSIBLE_DIR}/install-devops-tools.yml
---
- name: Install basic tools
  hosts: Ubuntu_Servers
  become: yes

  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes

    - name: Install Docker
      apt:
        name: docker.io
        state: present

    - name: Start Docker
      service:
        name: docker
        state: started
        enabled: yes
EOF
                        """
                    }
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                dir(env.ANSIBLE_DIR) {

                    withCredentials([
                        sshUserPrivateKey(
                            credentialsId: 'ec2-ubuntu-key',
                            keyFileVariable: 'SSH_KEY'
                        )
                    ]) {

                        sh '''
                        ansible-playbook \
                          -i inventory.ini \
                          --private-key "$SSH_KEY" \
                          -u ubuntu \
                          install-devops-tools.yml
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Terraform APPLY + Ansible completed successfully"
        }
        failure {
            echo "Pipeline failed — check logs"
        }
        always {
            echo "Pipeline execution finished"
        }
    }
}
