pipeline {
    agent any 
    

    tools {
        maven "maven"
        java  "java"
    }
    stages {
        stage {
            steps {
                script {
                    echo "Hello world!"
                }        
            }
        }
        stage {
            steps {
                sh 'echo "Evry body hello!"'
            }
        }
    }
}