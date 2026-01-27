pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "eu-west-2"
        TFVARS_FILE       = "prod.tfvars"
    }

    parameters {
        booleanParam(
            name: 'DESTROY',
            defaultValue: false,
            description: 'Set to true to destroy infrastructure'
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
                dir('shopnow-infra') {
                    sh 'terraform init -upgrade'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('shopnow-infra') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            when {
                expression { !params.DESTROY }
            }
            steps {
                dir('shopnow-infra') {
                    sh 'terraform plan -var-file=${TFVARS_FILE} -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { !params.DESTROY }
            }
            steps {
                dir('shopnow-infra') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.DESTROY }
            }
            steps {
                dir('shopnow-infra') {
                    sh 'terraform destroy -auto-approve -var-file=${TFVARS_FILE}'
                }
            }
        }
    }
}
