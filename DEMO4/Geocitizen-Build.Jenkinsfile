pipeline{
    agent any
    tools{
        maven "Maven-3-6-3"
    }
    parameters{
        booleanParam(name:'Publish to Nexus',defaultValue:true,description:'Publish citizen.war to Nexus Repository')
        booleanParam(name:'SonarQube Analys',defaultValue:true,description:'Analyse Geocitizen code')
        booleanParam(name:'Ansible',defaultValue:true,description:"Run Ansible pipeline after this pipeline")
        string(name:'WEB_IP',defaultValue:'0.0.0.0',description:'IP address of Geocitizen Instance on AWS')
        string(name:'DB_IP',defaultValue:'0.0.0.0',description:'IP address of PostgreSQL RDS Instance on AWS')
        string(name:'NEXUS_IP',defaultValue:'0.0.0.0',description:'IP address of Nexus server on GCP')
        string(name:'AWX_IP',defaultValue:'0.0.0.0',description:'IP address of AWX server on GCP')
        string(name:'DOCKER_IP',defaultValue:'0.0.0.0',description:'IP address of Docker server on GCP')
        string(name:'SENSU_IP',defaultValue:'0.0.0.0',description:'IP address of Sensu GO server on GCP')
        string(name:'SONAR_IP',defaultValue:'0.0.0.0',description:'IP address of SonarQube server on GCP')
        string(name:'MINIKUBE_IP',defaultValue:'0.0.0.0',description:'IP address of Minikube server on GCP')
    } 
    stages{
        stage('Clone Geocitizen'){
            steps{
                git branch: 'IA-115-andre-manual-deploy-geocitizen', credentialsId: 'github-cred', url: 'git@github.com:DevOpsAcademySS/Geocitizen.git'
            }
        }
        stage("Replace IP's and PORT in Geocitizen"){
            steps{
                echo "DB_IP: ${params.DB_IP}"
                echo "WEB_IP: ${params.WEB_IP}"
                bat "Automation\\replace_ip_and_port_geocitizen.sh ${params.DB_IP} ${params.WEB_IP}"
            }
        }
        stage('Build Geocitizen'){
            steps{
                nodejs('Nodejs-12-22-6'){
                    bat "Automation\\build_copy_edit.sh"
                }
            }
        }
        stage('SonarQube Analysis') {
            when{
                expression{ params['SonarQube Analys'] }
            }
            steps{
                withSonarQubeEnv(installationName:'Geocitizen',credentialsId: 'sonarqube-creds') {
                  bat "mvn clean verify sonar:sonar"
                }
            }
        }
        stage('Publish Artifact to Nexus Repository'){
            when{
                expression{ params['Publish to Nexus'] }
            }
            steps{
                // archiveArtifacts artifacts: 'target/citizen.war', fingerprint: true
                nexusPublisher nexusInstanceId: 'nexus-geo',
                nexusRepositoryId: 'geocitizen-maven-war',
                packages: [
                    [
                        $class: 'MavenPackage',
                        mavenAssetList: [
                            [
                                classifier: '',
                                extension: '',
                                filePath: 'target/citizen.war'
                            ]
                        ],
                        mavenCoordinate: [
                            artifactId: 'geo-citizen',
                            groupId: 'com.softserveinc',
                            packaging: 'war',
                            version: '1.0.5-SNAPSHOT'
                        ]
                    ]
                ]
            }
        }
    }
    post{
        success{
            echo "SUCCESS!)"
            script {
                if (params.Ansible == true)
                    build wait: false,
                    job: 'Ansible-Configuration-AWS-GCP',
                    parameters: [
                        string(name: 'WEB_IP', value: String.valueOf(params.WEB_IP)),
                        string(name: 'NEXUS_IP', value: String.valueOf(params.NEXUS_IP)),
                        string(name: 'AWX_IP', value: String.valueOf(params.AWX_IP)),
                        string(name: 'DOCKER_IP', value: String.valueOf(params.DOCKER_IP)),
                        string(name: 'SENSU_IP', value: String.valueOf(params.SENSU_IP)),
                        string(name: 'SONAR_IP', value: String.valueOf(params.SONAR_IP)),
                        string(name: 'MINIKUBE_IP', value: String.valueOf(params.MINIKUBE_IP)),
                        booleanParam(name: 'Configure Nexus', value: false),
                        booleanParam(name: 'Configure AWX', value: false),
                        booleanParam(name: 'Configure Docker', value: true),
                        booleanParam(name: 'Configure SonarQube', value: false)
                    ]
            }
        }
        failure{
            echo "FAIL:("
        }
    }
}