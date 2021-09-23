pipeline{
    agent any
    stages{
        stage('copy artifact'){
            steps{
                sh """
                cp /var/lib/jenkins/workspace/geocitizen-build/target/citizen.war /var/lib/jenkins/workspace/${JOB_NAME}/tomcat/files/
                """
            }
        }
        stage('change servers IPs'){
            steps{
                sh"""
                sed -i -E '/Ubuntu/s/ansible_host=[0-9.]*/ansible_host='$ubuntuIP'/g' inventory.txt 
                sed -i -E '/CentOs/s/ansible_host=[0-9.]*/ansible_host='$amazonIP'/g' inventory.txt 
                """
            }
        }
        stage('ansible RUN'){
            steps{
                withCredentials([file(credentialsId: 'ssh_key_to_ec', variable: 'ANSIBLE_PRIVATE_KEY')]){
                    sh 'ansible-playbook -i inventory.txt main.yml  --private-key=$ANSIBLE_PRIVATE_KEY'
                }
            }
        }
    }
}
