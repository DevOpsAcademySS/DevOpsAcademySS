pipeline{
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages{
        stage('Terraform Init'){
            steps{
                sh 'terraform init -no-color'
            }
        }
        stage('Terraform Apply'){
            sh 'terraform apply --auto-approve -no-color'
        }
    }
}