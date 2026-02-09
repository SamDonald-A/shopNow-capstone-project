pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "eu-west-3"
        TFVARS_FILE       = "prod.tfvars"
        TERRAFORM_DIR     = "shopnow-infra"
        ANSIBLE_DIR       = "ansible"
    }

    parameters {
        booleanParam(
            name: 'DESTROY_INFRA',
            defaultValue: true,
            description: 'Destroy infrastructure'
        )
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
            when {
                expression { !params.DESTROY_INFRA }
            }
            steps {
                dir(env.TERRAFORM_DIR) {
                    sh "terraform plan -var-file=${TFVARS_FILE} -out=tfplan"
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { !params.DESTROY_INFRA }
            }
            steps {
                dir(env.TERRAFORM_DIR) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Generate Ansible Inventory') {
            when {
                expression { !params.DESTROY_INFRA }
            }
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
            when {
                expression { !params.DESTROY_INFRA }
            }
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

        stage('Terraform Destroy') {
            when {
                expression { params.DESTROY_INFRA }
            }
            steps {
                dir(env.TERRAFORM_DIR) {
                    sh "terraform destroy -auto-approve -var-file=${TFVARS_FILE}"
                }
            }
        }
    }

    post {
        success {
            echo params.DESTROY_INFRA ?
                "✅ Terraform DESTROY completed" :
                "✅ Terraform APPLY + Ansible completed"
        }
        failure {
            echo params.DESTROY_INFRA ?
                "❌ Terraform DESTROY failed" :
                "❌ Terraform APPLY / Ansible failed"
        }
        always {
            echo "ℹ️ Pipeline execution finished"
        }
    }
}
