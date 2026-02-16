pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "eu-west-3"
        TFVARS_FILE        = "prod.tfvars"
        TERRAFORM_DIR      = "shopnow-infra"
        ANSIBLE_DIR        = "ansible"
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
${publicIp} ansible_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no'
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
            echo " Terraform APPLY + Ansible completed successfully"
        }
        failure {
            echo " Pipeline failed — check logs"
        }
        always {
            echo " Pipeline execution finished"
        }
    }
}
