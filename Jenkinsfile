pipeline {
  agent any
  environment {
      AWS_DEFAULT_REGION="us-west-1"
  }
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
      stage('Terraform Apply') {
        steps {
          withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'jenkins-terraform-user', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
              sh 'terraform apply --auto-approve -no-color'
          }
        }
      }
  }
}