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
        string(name:'DOCKER_IP',defaultValue:'0.0.0.0',description:'IP address of Docker server on GCP')
        booleanParam(name:'Configure Nexus',defaultValue:false,description:'Configure Nexus Repository 3 on GCP Instance')
        booleanParam(name:'Configure Docker',defaultValue:false,description:'Configure Docker on GCP Instance')
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
                sh "./set_ips.sh ${params.NEXUS_IP} ${params.WEB_IP} ${params.DOCKER_IP}"
            }
        }
        stage('Set Roles Vars'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'nexus-creds', passwordVariable: 'NEXUS_PASS', usernameVariable: 'NEXUS_USR')]){
                    sh "./set_vars.sh ${params.NEXUS_IP} ${NEXUS_USR} ${NEXUS_PASS}"
                }
            }
        }
        stage('Configure Instance for Nexus Repository'){
            when{
                expression { params['Configure Nexus'] }
            }
            steps{
                sh "ansible-playbook setup_nexus_play.yaml"
            }
        }
        stage('Configure Instance for Docker'){
            when{
                expression { params['Configure Docker'] }
            }
            steps{
                sh "ansible-playbook setup_docker_play.yaml"
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
                sh "ansible-playbook containerize_geo_play.yaml"
            }
        }
        stage("Configure AWS Instance with Docker and Setup Geocitizen"){
            steps{
                sh "ansible-playbook setup_gecitizen_play.yaml"
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