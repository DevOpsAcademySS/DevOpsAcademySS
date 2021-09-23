def amazonIP = '0'
def ubuntuIP = '0'
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
            steps{
                sh 'terraform apply --auto-approve -no-color'
            }
        }
        stage('Terraform output servers IPs'){
            steps{           
                sh """ terraform output web_server_ip | tr -d '"' > .amazonip """
                sh """ terraform output db_ip | tr -d '"' > .ubuntuip """ 
                 script {
                    amazonIP = readFile('.amazonip').trim()
                    ubuntuIP = readFile('.ubuntuip').trim()
                }
            }
        }
    }
    post {
        success {
            //build job: 'geo-ansible-job', parameters: [string(name: 'amazonIP', value: String.valueOf(amazonIP)), string(name: 'ubuntuIP', value: String.valueOf(ubuntuIP))], wait:false
            build job: 'geocitizen-build', parameters: [string(name: 'amazonIP', value: String.valueOf(amazonIP)), string(name: 'ubuntuIP', value: String.valueOf(ubuntuIP))], wait:false
        }
    }
}
