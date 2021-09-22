pipeline{
    agent any
    parameters{
        string(name:'WEB_IP',defaultValue:'0.0.0.0',description:'IP address of Geocitizen server on AWS')
        string(name:'DB_IP',defaultValue:'0.0.0.0',description:'IP address of PostgreSQL server on AWS')
    }
    stages{
        stage("Clone Ansible from GitHub"){
            steps{
                git branch: 'IA-191-andre-create-ansible-playbook-for-setup-application-and-database', credentialsId: 'github-cred', url: 'git@github.com:DevOpsAcademySS/DevOpsAcademySS.git'
            }
        }
        stage("Change Host IP's in 'inventory.txt'"){
            steps{
                echo "WEB_IP: ${params.WEB_IP}"
                echo "DB_IP: ${params.DB_IP}"
                bat ".\\replace_ip_inventory.sh ${params.WEB_IP} ${params.DB_IP}"
            }
        }
        stage("Run Ansible Playbook"){
            steps{
                echo "TO BE DONE"
                // bat "ansible-playbook playbook.yml"
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