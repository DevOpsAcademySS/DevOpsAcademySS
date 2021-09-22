def amazonIP = '0'
def ubuntuIP = '0'
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
                   sh """ terraform output amazon-server-public-ip | tr -d '"' > .amazonip """
                   sh """ terraform output ubuntu-server-public-ip | tr -d '"' > ubuntuip """
                }
                 script {
                    amazonIP = readFile('.amazonip').trim()
                    ubuntuIP = readFile('.ubuntuip').trim()
                }
            }
        }
        stage('Starting AWX JOB'){
            steps{
                build job: 'geo-awx-job', parameters: [string(name: 'amazonIP', value: String.valueOf(amazonIP)), string(name: 'ubuntuIP', value: String.valueOf(ubuntuIP))], wait:false
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