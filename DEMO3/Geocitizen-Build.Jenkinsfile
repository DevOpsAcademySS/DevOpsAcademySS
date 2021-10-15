pipeline{
    agent any
    tools{
        maven "Maven-3-6-3"
    }
    parameters{
        booleanParam(name:'Ansible',defaultValue:true,description:"Run Ansible pipeline after this pipeline")
        string(name:'WEB_IP',defaultValue:'0.0.0.0',description:'IP address of Geocitizen Instance on AWS')
        string(name:'DB_IP',defaultValue:'0.0.0.0',description:'IP address of PostgreSQL RDS Instance on AWS')
        string(name:'NEXUS_IP',defaultValue:'0.0.0.0',description:'IP address of Nexus server on GCP')
        string(name:'DOCKER_IP',defaultValue:'0.0.0.0',description:'IP address of Docker server on GCP')
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
        stage('Publish Artifact to Nexus Repository'){
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
                        string(name: 'DOCKER_IP', value: String.valueOf(params.DOCKER_IP)),
                        string(name: 'Nexus Username', value: 'yor_username'),
                        string(name: 'Nexus Password', value: 'yor_password'),
                        booleanParam(name: 'Configure Nexus', value: false),
                        booleanParam(name: 'Configure Docker', value: true)
                    ]
            }
        }
        failure{
            echo "FAIL:("
        }
    }
}
