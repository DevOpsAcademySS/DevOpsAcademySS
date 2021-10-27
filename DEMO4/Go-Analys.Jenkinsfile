pipeline{
    agent any
    parameters{
        booleanParam(name:'SonarQube Analys',defaultValue:true,description:'Analyse Python code')
        string(name:"Project Key",defaultValue:"PythonProj",description:'Key for your SonarQube Project')
    }
    stages{
        stage('Clone Go Repo'){
            steps{
                git branch: 'IA-141-andre-python-for-devops', credentialsId: 'github-cred', url: 'git@github.com:DevOpsAcademySS/DevOpsAcademySS.git'
            }
        }
        stage('Go SonarQube Analysis') {
            when{
                expression{ params['SonarQube Analys'] }
            }
            steps{
                writeFile encoding: 'UTF-8', file: 'sonar-project.properties', text: "sonar.projectKey=${params['Project Key']}"
                script {
                    def scannerHome = tool 'SonarScanner';
                    withSonarQubeEnv(credentialsId: 'sonarqube-creds') {
                        bat "${scannerHome}/bin/sonar-scanner";
                    }
                }
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