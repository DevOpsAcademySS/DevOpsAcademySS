pipeline{
    agent any
    environment {
        // set path for terragrant-cache if you have 
        // problem with path name more than 255 characters
        TERRAGRUNT_DOWNLOAD = "D:\\JenkinsHome\\.terragrunt-cache"
    }
    parameters{
        booleanParam(name:"Show Plan",defaultValue:true,description:"Validate Terragrunt and Show Plan for Infrastructure")
        booleanParam(name:"Apply AWS",defaultValue:true,description:"Apply Terragrunt for AWS Infrastructure")
        booleanParam(name:"Apply GCP",defaultValue:true,description:"Apply Terragrunt for GCP Infrastructure")
        booleanParam(name:"Destroy AWS",defaultValue:false,description:"Destroy Infrastructure of AWS")
        booleanParam(name:"Destroy GCP",defaultValue:false,description:"Destroy Infrastructure of GCP")
        booleanParam(name:"Build Geocitizen",defaultValue:true,description:"Build Geocitizen WAR")
        booleanParam(name:"Ansible Configuration",defaultValue:true,description:"Configure All Instances on AWS and GCP")
        text(name: 'Shell script', 
        defaultValue: '''#!/bin/sh

echo "Hello world!"
        ''', description: 'Shell script for Terragrunt inputs which sets input values')
    }
    stages{
        stage('Clone Terragrunt'){
            steps{
                git branch: 'IA-222-andre-use-terragrant-gcp', credentialsId: 'github-cred', url: 'git@github.com:DevOpsAcademySS/DevOpsAcademySS.git'
            }
        }
        stage('Setup Terragrunt inputs'){
            steps{
                writeFile encoding: 'UTF-8', file: 'set_inputs.sh', text: String.valueOf(params['Shell script'])
                bat "set_inputs.sh"
            }
        }
        stage('Terragrunt Validate and Plan GCP and AWS Infrastructures'){
            when {
                expression { params['Show Plan'] == true }
            }
            steps{
                dir('aws/stage') {
                    bat "terragrunt run-all validate"
                    bat "terragrunt run-all plan -no-color"
                }
                dir('gcp/stage') {
                    bat "terragrunt run-all validate"
                    bat "terragrunt run-all plan -no-color"
                }
            }
        }
        stage('Terragrunt Apply AWS Infrastructure'){
            when{
                expression { params['Apply AWS'] }
            }
            steps{
                // dir('aws/stage') {
                //     bat "terragrunt run-all apply --terragrunt-non-interactive -no-color"
                // }
                dir('aws/stage/geocitizen') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output -raw instance_public_ip > WEB_IP.txt"
                    script{
                        env.WEB_IP = readFile('WEB_IP.txt').trim()
                    }
                    echo "Web IP: ${env.WEB_IP}"
                }

                dir('aws/stage/rds') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output -raw instance_public_ip > DB_IP.txt"
                    script{
                        //Get ip addres from dns
                        InetAddress dnsInetAddress = InetAddress.getByName readFile('DB_IP.txt').trim()
                        env.DB_IP = dnsInetAddress.hostAddress
                    }
                    echo "DB IP: ${env.DB_IP}"
                }
            }
        }
        stage('Terragrunt Apply GCP Infrastructure'){
            when{
                expression { params['Apply GCP'] }
            }
            steps{
                // dir('gcp/stage') {
                //     bat "terragrunt run-all apply --terragrunt-non-interactive -no-color"
                // }
                dir('gcp/stage/awx') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output instance_public_ip > AWX_IP.txt"
                    script{
                        env.AWX_IP = (readFile('AWX_IP.txt').trim() =~ "nat_ip\" = \"(.*)\"")[0][1]
                    }
                    echo "AWX IP: ${env.AWX_IP}"
                }
                dir('gcp/stage/sensu') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output instance_public_ip > SENSU_IP.txt"
                    script{
                        env.SENSU_IP = (readFile('SENSU_IP.txt').trim() =~ "nat_ip\" = \"(.*)\"")[0][1]
                    }
                    echo "Nexus IP: ${env.SENSU_IP}"
                }
                dir('gcp/stage/nexus') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output instance_public_ip > NEXUS_IP.txt"
                    script{
                        env.NEXUS_IP = (readFile('NEXUS_IP.txt').trim() =~ "nat_ip\" = \"(.*)\"")[0][1]
                    }
                    echo "Nexus IP: ${env.NEXUS_IP}"
                }
                dir('gcp/stage/docker') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output instance_public_ip > DOCKER_IP.txt"
                    script{
                        env.DOCKER_IP = (readFile('DOCKER_IP.txt').trim() =~ "nat_ip\" = \"(.*)\"")[0][1]
                    }
                    echo "Dcoker IP: ${env.DOCKER_IP}"
                }
                dir('gcp/stage/sonar') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output instance_public_ip > SONAR_IP.txt"
                    script{
                        env.SONAR_IP = (readFile('SONAR_IP.txt').trim() =~ "nat_ip\" = \"(.*)\"")[0][1]
                    }
                    echo "SonarQube IP: ${env.SONAR_IP}"
                }
                dir('gcp/stage/minikube') {
                    bat "terragrunt apply -auto-approve -no-color"
                    bat "terragrunt output instance_public_ip > MINIKUBE_IP.txt"
                    script{
                        env.MINIKUBE_IP = (readFile('MINIKUBE_IP.txt').trim() =~ "nat_ip\" = \"(.*)\"")[0][1]
                    }
                    echo "Minikube IP: ${env.MINIKUBE_IP}"
                }
            }
        }
        stage('Terragrunt Destroy AWS Infrastructure'){
            when{
                expression { params['Destroy AWS'] }
            }
            steps{
                dir('aws/stage') {
                    bat "terragrunt run-all destroy --terragrunt-non-interactive -no-color"
                }
            }
        }
        stage('Terragrunt Destroy GCP Infrastructure'){
            when{
                expression { params['Destroy GCP'] }
            }
            steps{
                dir('gcp/stage') {
                    bat "terragrunt run-all destroy --terragrunt-non-interactive -no-color"
                }
            }
        }
    }
    post{
        success{
            echo "SUCCESS!)"
            script {
                if (params['Build Geocitizen'] == true)
                   build wait: false,
                   job: 'Build-Geocitizen',
                   parameters: [
                        booleanParam(name: 'Ansible', value: true),
                        string(name: 'WEB_IP', value: String.valueOf(env.WEB_IP)),
                        string(name: 'DB_IP', value: String.valueOf(env.DB_IP)),
                        string(name: 'NEXUS_IP', value: String.valueOf(env.NEXUS_IP)),
                        string(name: 'AWX_IP', value: String.valueOf(env.AWX_IP)),
                        string(name: 'DOCKER_IP', value: String.valueOf(env.DOCKER_IP)),
                        string(name: 'SENSU_IP', value: String.valueOf(env.SENSU_IP)),
                        string(name: 'SONAR_IP', value: String.valueOf(env.SONAR_IP)),
                        string(name: 'MINIKUBE_IP', value: String.valueOf(env.MINIKUBE_IP))
                    ]
                if (params['Ansible Configuration'] == true)
                    build wait: false,
                    job: 'Ansible-Configuration-AWS-GCP',
                    parameters: [
                        string(name: 'WEB_IP', value: String.valueOf(env.WEB_IP)),
                        string(name: 'NEXUS_IP', value: String.valueOf(env.NEXUS_IP)),
                        string(name: 'AWX_IP', value: String.valueOf(env.AWX_IP)),
                        string(name: 'DOCKER_IP', value: String.valueOf(env.DOCKER_IP)),
                        string(name: 'SENSU_IP', value: String.valueOf(env.SENSU_IP)),
                        string(name: 'SONAR_IP', value: String.valueOf(env.SONAR_IP)),
                        string(name: 'MINIKUBE_IP', value: String.valueOf(env.MINIKUBE_IP)),
                        booleanParam(name: 'Configure Nexus', value: false),
                        booleanParam(name: 'Configure AWX', value: false),
                        booleanParam(name: 'Configure Docker', value: true),
                        booleanParam(name: 'Configure SonarQube', value: false),
                        booleanParam(name: 'Configure Minikube', value: false),
                    ]
            }
        }
        failure{
            echo "FAIL:("
        }
    }
}