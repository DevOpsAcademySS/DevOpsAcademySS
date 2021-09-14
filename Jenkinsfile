pipeline {
    agent any 


    // tools {
    //     maven "maven"
    //     java "java"
    // }
    stages {
        stage('first stage') {
            steps {
                script {
                    echo "Hello world!"
                }        
            }
        }
        stage('second stage') {
            steps {
                sh 'echo "Evry body hello!"'
            }
        }
    }
}