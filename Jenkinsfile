pipeline {
    agent any
        tools {
       terraform 'terraform'
    }
    environment {
        AWS_DEFAULT_REGION = 'eu-west-1'
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        
        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform in branch, ${env.BRANCH_NAME}"
                // Add your build steps here
                sh """
                ls -lrth
                terraform init 
                """
            }
            }

        stage('Validate') {
                // Add comments to check if branch is main, dev, stag and DEN-*
            steps {
                echo "Running Validation in branch ${env.BRANCH_NAME}"
                // Add your test steps here
                sh 'terraform validate'
            }
        }
        stage('Plan') {
                // Add comments to check if branch is main, dev, stag and DEN-*
            steps {
                echo "Running Plan in branch ${env.BRANCH_NAME}"
                // Add your test steps here
                script {
                    sh 'terraform plan -out=planfile.tfplan'
                    archiveArtifacts artifacts: 'planfile.tfplan', fingerprint: true
                }
            }
        }

        stage('Apply') {
            when {
                branch 'main'
            }
            steps {
                echo "Running Apply in branch ${env.BRANCH_NAME}"
                // This runs on merge to master only ...
                script {
                    sh 'terraform apply -auto-approve planfile.tfplan'
                }
            }
        }
    }
}
