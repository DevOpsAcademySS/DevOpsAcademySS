pipeline {
    agent any
    parameters { 
        booleanParam(name: 'Destroy', defaultValue: false, description: 'Destroy Terraform') 
        booleanParam(name: 'Build_Gocitizen', defaultValue: true, description: 'Build Gocitizen after Terraform apply') 
    }
    stages{
        stage('Terraform Init'){
            steps{
                bat 'terraform init'
            }
        }
        stage('Show Terraform Plan'){
            when {
                expression { params.Destroy == false }
            }
            steps{
                bat 'terraform plan'
            }
        }
        stage('Terraform Apply'){
            when {
                expression { params.Destroy == false }
            }
            steps{
                bat 'terraform apply --auto-approve -no-color'
            }
        }
        stage('Terraform Destroy'){
            when {
                expression { params.Destroy == true }
            }
            steps{
                bat 'terraform destroy --auto-approve -no-color'
            }
        }
        stage("Save Terraform output in 'ec2ips.txt', 'db_ip.txt' and 'web_ip.txt'"){
            when {
                expression { params.Destroy == false }
            }
            steps{
                bat 'terraform output > ec2ips.txt'
                bat 'terraform output -raw ubuntu_public_ip_address > db_ip.txt'
                bat 'terraform output -raw redhat_public_ip_address > web_ip.txt'
            }
        }
        stage("Save IP's in environment variables"){
            when {
                expression { params.Destroy == false }
            }
            steps{
                echo "Destroy is: ${params.Destroy}"
                script {
                    env.DB_IP = readFile('db_ip.txt').trim()
                    env.WEB_IP = readFile('web_ip.txt').trim()
                }
                echo "DB_IP: ${env.DB_IP}"
                echo "WEB_IP: ${env.WEB_IP}"
            }
        }
    }
     post {
        success {
            echo "SUCCESS!) Building Geocitizen!"
            script {
                if (params.Destroy == false && params.Build_Gocitizen == true) {
                    build job: 'GitHub-Geocitizen-Build', parameters: [string(name: 'WEB_IP', value: String.valueOf(env.WEB_IP)), string(name: 'DB_IP', value: String.valueOf(env.DB_IP))]
                }
            }
        }
        failure{
            echo "FAIL:(!"
        }
     }
}
