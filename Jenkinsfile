pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "myapp"
    }

    stages {
        stage("Git Clone") {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'master']],
                    extensions: [
                        [$class: 'RelativeTargetDirectory', relativeTargetDir: 'app']
                    ],
                    userRemoteConfigs: [[url: 'https://github.com/Sclra/java-hello-world-with-maven.git']]
                ])
            }
        }

        stage("Build JAR File") {
            steps {
                echo "===================== Building JAR file ======================="
                sh "cd app && mvn clean package"
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    docker.build("${env.DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }
      
        stage("Build") {
            steps {
                withMaven(
                    mavenSettingsConfig: 'nexus-maven' // (3)
                ){
                sh "cd app && mvn clean deploy"
                }  
            }
         }

        }
    }

