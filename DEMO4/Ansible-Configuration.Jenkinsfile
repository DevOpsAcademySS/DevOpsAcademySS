pipeline{
    agent { 
        node { 
            label 'ubuntu_ansible' 
        } 
    }
    environment{
        CITIZEN_DOWNLOAD_URL="/repository/geocitizen-maven-war/com/softserveinc/geo-citizen/1.0.5-SNAPSHOT/geo-citizen-1.0.5-SNAPSHOT.war"
    }
    parameters{
        string(name:'WEB_IP',defaultValue:'0.0.0.0',description:'IP address of Geocitizen server on AWS')
        string(name:'NEXUS_IP',defaultValue:'0.0.0.0',description:'IP address of Nexus server on GCP')
        string(name:'AWX_IP',defaultValue:'0.0.0.0',description:'IP address of AWX server on GCP')
        string(name:'DOCKER_IP',defaultValue:'0.0.0.0',description:'IP address of Docker server on GCP')
        string(name:'SENSU_IP',defaultValue:'0.0.0.0',description:'IP address of Sensu GO server on GCP')
        string(name:'SONAR_IP',defaultValue:'0.0.0.0',description:'IP address of SonarQube server on GCP')
        string(name:'MINIKUBE_IP',defaultValue:'0.0.0.0',description:'IP address of Minikube server on GCP')
        booleanParam(name:'Configure Nexus',defaultValue:false,description:'Configure Nexus Repository 3 on GCP Instance')
        booleanParam(name:'Configure AWX',defaultValue:false,description:'Configure AWX on GCP Instance')
        booleanParam(name:'Configure Docker',defaultValue:false,description:'Configure Docker on GCP Instance')
        booleanParam(name:'Configure SonarQube',defaultValue:false,description:'Configure Docker on GCP Instance')
        booleanParam(name:'Configure Minikube',defaultValue:false,description:'Configure Minikube on GCP Instance')
    }
    stages{
        stage("Clone Ansible from GitHub"){
            steps{
                git branch: 'IA-219-andre-containerization-geocitizen-and-deliver', credentialsId: 'github-cred', url: 'git@github.com:DevOpsAcademySS/DevOpsAcademySS.git'
            }
        }
        stage("Change Host IP's in 'hosts.txt'"){
            steps{
                echo "WEB_IP: ${params.WEB_IP}"
                echo "NEXUS_IP: ${params.NEXUS_IP}"
                echo "DOCKER_IP: ${params.DOCKER_IP}"
                sh "chmod +x *.sh"
                sh "./set_ips.sh ${params.NEXUS_IP} ${params.WEB_IP} ${params.DOCKER_IP} ${params.SONAR_IP} ${params.MINIKUBE_IP}"
            }
        }
        stage('Configure Instance for Nexus Repository'){
            when{
                expression { params['Configure Nexus'] }
            }
            steps{
                sh "ansible-playbook setup_nexus_play.yml"
            }
        }
        stage('Configure Instance for Docker'){
            when{
                expression { params['Configure Docker'] }
            }
            steps{
                sh "ansible-playbook setup_docker_play.yml"
            }
        }
        stage('Configure Instance for SonarQube'){
            when{
                expression { params['Configure SonarQube'] }
            }
            steps{
                sh "ansible-playbook setup_sonarqube_play.yml"
            }
        }
        stage('Configure Instance for Minikube'){
            when{
                expression { params['Configure Minikube'] }
            }
            steps{
                sh "ansible-playbook setup_minikube_play.yml"
            }
        }
        stage('Download citizen.war from Nexus Repository'){
            steps{
                dir('roles/ContainerizeGeo/files'){
                    sh "wget http://${params.NEXUS_IP}:8081${env.CITIZEN_DOWNLOAD_URL} -O citizen.war"
                }
            }
        }
        stage('Containerize Geocitizen and Save to Nexus Docker Rgistry'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'nexus-creds', passwordVariable: 'NEXUS_PASS', usernameVariable: 'NEXUS_USR')]){
                    sh "ansible-playbook containerize_geo_play.yml"
                }
            }
        }
        stage("Configure AWS Instance with Docker and Setup Geocitizen"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'nexus-creds', passwordVariable: 'NEXUS_PASS', usernameVariable: 'NEXUS_USR')]){
                    sh "ansible-playbook setup_geocitizen_play.yml"
                }
            }
        }
    }
    post{
        success{
            echo "SUCCESS!) Check Geocitizen at: http://${params.WEB_IP}:8080/citizen"
        }
        failure{
            echo "FAIL:("
        }
    }
}