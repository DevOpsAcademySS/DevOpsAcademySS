pipeline{
    agent { 
        node { 
            label 'ubuntu_ansible' 
        } 
    }
    parameters{
        string(name:'WEB_IP',defaultValue:'0.0.0.0',description:'IP address of Geocitizen server on AWS')
        string(name:'DB_IP',defaultValue:'0.0.0.0',description:'IP address of PostgreSQL server on AWS')
    }
    stages{
        stage("Change Host IP's in 'inventory.txt'"){
            steps{
                echo "WEB_IP: ${params.WEB_IP}"
                echo "DB_IP: ${params.DB_IP}"
                sh """
                sed -i "s/{{ web_ip }}/${params.WEB_IP}/" "./inventory.txt"
                sed -i "s/{{ db_ip }}/${params.DB_IP}/" "./inventory.txt"
                """
            }
        }
        stage("Copy artifact citizen.war"){
            steps{
                copyArtifacts projectName: 'Build-Geocitizen', filter: 'target/citizen.war', fingerprintArtifacts: true, target: 'roles/RedHat/files'
                sh "ls roles/RedHat/files"
            }
        }
        stage("Run Ansible Playbook"){
            steps{
                sh "ansible-playbook playbook.yml"
            }
        }
    }
    post{
        success{
            echo "SUCCESS!)"
        }
        failure{
            echo "FAIL:("
        }
    }
}