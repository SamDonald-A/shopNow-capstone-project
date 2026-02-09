pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "eu-west-3"
        TFVARS_FILE       = "prod.tfvars"
        TERRAFORM_DIR     = "shopnow-infra"
        ANSIBLE_DIR       = "ansible"
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

        stage('Generate Ansible Inventory') {
            steps {
                dir(env.TERRAFORM_DIR) {
                    script {
                        def publicIp = sh(
                            script: "terraform output -raw public_ip",
                            returnStdout: true
                        ).trim()

                        sh """
                        mkdir -p ../${ANSIBLE_DIR}
                        cat <<EOF > ../${ANSIBLE_DIR}/inventory.ini
[Ubuntu_Servers]
${publicIp} ansible_user=ubuntu
EOF
                        """
                    }
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sshagent(credentials: ['ec2-ubuntu-key']) {
                    dir(env.ANSIBLE_DIR) {
                        sh '''
                          ansible-playbook \
                            -i inventory.ini \
                            install-devops-tools.yml
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Terraform APPLY + Ansible completed successfully"
        }
        failure {
            echo "❌ Pipeline failed — check logs"
        }
        always {
            echo "ℹ️ Pipeline execution finished"
        }
    }
}
