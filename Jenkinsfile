pipeline{
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        ANSIBLE_PRIVATE_KEY   = credentials('ssh_key_to_ec')
    }
    stages{
        stage('copy artifact'){
            steps{
                copyArtifacts filter: 'target/citizen.war', target: 'tomcat/files' ,fingerprintArtifacts: true, flatten: true, projectName: 'geocitizen-build', selector: upstream(fallbackToLastSuccessful: true)
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
                sh 'ansible-playbook -i inventory.txt main.yml  --private-key=$ANSIBLE_PRIVATE_KEY'
            }
        }
    }
}