def amazonIP = '0'
def ubuntuIP = '0'
pipeline{
    agent any
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
                    sh '(cd aws-geo && terraform init -no-color)'
                }    
            }
        }
        // stage('Terraform Apply'){
        //     steps{
        //         withAWS(credentials: 'aws-credential-geocitizen') {
        //             sh 'terraform apply --auto-approve -no-color'
        //         }
        //     }
        // }
        // stage('Terraform output servers IPs'){
        //     steps{
        //         withAWS(credentials: 'aws-credential-geocitizen') {
        //            sh """ terraform output -raw amazon-server-public-ip > .amazonip """
        //            sh """ terraform output -raw ubuntu-server-public-ip > .ubuntuip """
        //         }
        //          script {
        //             amazonIP = readFile('.amazonip').trim()
        //             ubuntuIP = readFile('.ubuntuip').trim()
        //         }
        //     }
        // }
    }
    post {
        success {
            // build job: 'geo-awx-job', parameters: [string(name: 'amazonIP', value: String.valueOf(amazonIP)), string(name: 'ubuntuIP', value: String.valueOf(ubuntuIP))], wait:false
            // build job: 'geocitizen-build', parameters: [string(name: 'amazonIP', value: String.valueOf(amazonIP)), string(name: 'ubuntuIP', value: String.valueOf(ubuntuIP))], wait:false
            telegramSend('JOB $JOB_NAME FINNISHED SUCCESFULL. STARTING ANSIBLE AND GEOCITIZEN JOBS')
        }
        failure { 
            telegramSend('JOB $JOB_NAME FAILED')
        }
    }
}