def amazonIP = '0'
def ubuntuIP = '0'
pipeline{
    agent any
    environment {
        AWS_ACCESS_KEY_ID               = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY           = credentials('AWS_SECRET_ACCESS_KEY')
        GOOGLE_APPLICATION_CREDENTIALS  = credentials('gcp-key')
    }
    stages{
        stage('Terragrunt Plan'){
            steps{
                sh 'sudo terragrunt -version'
                sh 'terragrunt run-all plan -no-color'
            }
        }
        stage('Terragrunt Apply'){
            steps{
                sh 'terragrunt run-all apply --auto-approve -no-color'
            }
        }
        stage('Terraform output servers IPs'){
            steps{           
                sh """ terraform output web_server_ip | tr -d '"' > .amazonip """
                sh """ terraform output ip | tr -d '"' > .ubuntuip """ 
                 script {
                    amazonIP = readFile('.amazonip').trim()
                    ubuntuIP = readFile('.ubuntuip').trim()
                }
            }
        }
    }
    //post {
        //success {
            //build job: 'geo-ansible-job', parameters: [string(name: 'amazonIP', value: String.valueOf(amazonIP)), string(name: 'ubuntuIP', value: String.valueOf(ubuntuIP))], wait:false
            //build job: 'geocitizen-build', parameters: [string(name: 'amazonIP', value: String.valueOf(amazonIP)), string(name: 'ubuntuIP', value: String.valueOf(ubuntuIP))], wait:false
        //}
    //}
}
