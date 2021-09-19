pipeline{
    agent {
  label 'agent-ubuntu'
}
    environment {
        ANSIBLE_PRIVATE_KEY     = credentials('aws-credential-ansible')
}
    stages{
        //stage('Git checkout'){
        //    steps{
        //        git branch: 'IA-196-mykola-ansible-pipeline', credentialsId: '0d321903-fc6f-4ed8-840a-25772018b1b1', url: 'https://github.com/DevOpsAcademySS/DevOpsAcademySS.git'    
        //    }
        //}
        stage('change servers IPs'){
            steps{
                sh """
                sed -i -E '\\|amazonlinux|s|=.*|='\$(cat $HOME/.cache/amazon_ip | tr -d '"')'|g' hosts.txt
                sed -i -E '\\|ubuntulinux|s|=.*|='\$(cat $HOME/.cache/ubuntu_ip | tr -d '"')'|g' hosts.txt
                """
            }
        }
        stage('ansible RUN'){
            steps{
                sh 'ansible-playbook deploy_geo.yml --private-key=$ANSIBLE_PRIVATE_KEY'
            }
        }

    }
    post {
        success { 
            telegramSend('JOB $JOB_NAME FINNISHED SUCCESFUL.')
        }
        failure { 
            telegramSend('JOB $JOB_NAME FAILED.')
        }
    }
}