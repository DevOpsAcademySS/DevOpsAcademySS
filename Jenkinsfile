pipeline{
    agent any
    tools {
        terraform 'terraform'
    }
    stages{
        stage('Git Checkout'){
            steps {
                git branch: 'IA-179-samir-terraform', credentialsId: 'github2', url: 'https://github.com/DevOpsAcademySS/DevOpsAcademySS'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Apply'){
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}