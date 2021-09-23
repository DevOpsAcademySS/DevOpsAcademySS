pipeline{
    agent any
 environment {
        ANSIBLE_PRIVATE_KEY     = credentials('aws-credential-ansible')
}
parameters {
        string(name: 'amazonIP', defaultValue: '0', description: 'IP for Amazon host')
}
    stages{
        stage('copy artifact'){
            steps{
                copyArtifacts filter: 'target/citizen.war', fingerprintArtifacts: true, flatten: true, projectName: 'geocitizen-build', selector: upstream(fallbackToLastSuccessful: true)
            }
        }
         stage('Check if geo-awx-job is DONE'){
            steps{
                waitUntil(initialRecurrencePeriod: 5000) {
                    script {
                        def job = jenkins.model.Jenkins.instance.getItemByFullName("geo-awx-job")
                        def result = job.getLastBuild().getResult().toString()
                        println (result)
                        if ( result == "SUCCESS") {
                            return true
                        }else if ( result == "FAILURE"){
                            error("JOB failed because geo-awx-job FAILED!")
                        }
                        else{
                            println("geo-awx-job is not done yet!")
                            return false
                        }
                    }
                }
            }
        }
        stage('run deploy playbook'){
            steps{
                sh 'ansible-playbook -i "${amazonIP}," deploy.yml --private-key=$ANSIBLE_PRIVATE_KEY'
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