pipeline {
    agent any
    stages {
        stage("git clone") {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'master']],
                    extensions: [
                        [$class: 'RelativeTargetDirectory', relativeTargetDir: 'app']   // put folder name as string
                    ],
                    userRemoteConfigs: [[url: 'https://github.com/Sclra/java-hello-world-with-maven.git']]
                ])
            }
        }
        stage("A"){
            steps{
                echo "=====================build jar file=======================" 
                sh "cd app && mvn clean package"
            }
        }
    }
}