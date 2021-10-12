def amazonIP = '0'
def ubuntuIP = '0'
pipeline{
    agent any
    stages{
        stage('Terragrunt Plan'){
            steps{
                withAWS(credentials: 'aws_key_for_geo') {
                    sh 'cd tomcat'
                    sh 'sudo terragrunt -version'
                    sh 'sudo terragrunt plan -no-color'
                }
            }
        }
        stage('Terragrunt Apply'){
            steps{
                sh 'sudo terragrunt apply --auto-approve -no-color'
            }
        }
        stage('Terraform output servers IPs'){
            steps{           
                sh """ sudo terraform output web_server_ip | tr -d '"' > .amazonip """
                sh """ sudo terraform output ip | tr -d '"' > .ubuntuip """ 
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
