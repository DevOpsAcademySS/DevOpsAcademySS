pipeline{
    agent {
  label 'agent-ubuntu'
}
    tools {
  terraform 'terraform-ubuntu'
}
    stages{
        //stage('Git checkout'){
        //    steps{
        //        git branch: 'IA-195-mykola-terraform-pipeline', credentialsId: '0d321903-fc6f-4ed8-840a-25772018b1b1', url: 'https://github.com/DevOpsAcademySS/DevOpsAcademySS.git'    
        //    }
        //}
        stage('Terraform Init'){
            steps{
                withAWS(credentials: 'aws-credential-geocitizen') {
                    sh 'terraform init -no-color'
                }    
            }
        }
        stage('Terraform Apply'){
            steps{
                withAWS(credentials: 'aws-credential-geocitizen') {
                    sh 'terraform apply --auto-approve -no-color'
                }
            }
        }
        stage('Terraform output servers IPs'){
            steps{
                withAWS(credentials: 'aws-credential-geocitizen') {
                    sh """
                    terraform output amazon-server-public-ip > $HOME/.cache/amazon_ip
                    terraform output ubuntu-server-public-ip > $HOME/.cache/ubuntu_ip
                    """
                }
            }
        }
    }
    post {
        success { 
            telegramSend('JOB $JOB_NAME FINNISHED SUCCESFULL. STARTING ANSIBLE AND GEOCITIZEN JOBS')
        }
        failure { 
            telegramSend('JOB $JOB_NAME FAILED')
        }
    }
}