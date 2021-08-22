pipeline {
    environment {
        imagename = 'caacuk/express_example'
        registryUrl = 'docker.io'
        registryCredential = '1'
        dockerImage = ''
    }
    agent none
    stages {
        stage('Install') {
            agent { 
                docker { 
                    image 'node:14-alpine' 
                } 
            }
            steps {
                sh 'yarn install'
            }
        }

        stage('Build Image') {
            steps{
                script {
                    dockerImage = docker.build imagename
                }
            }
        }
        
        stage('Push Image') {
            steps{
                script {
                    docker.withRegistry( registryUrl, registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest') 
                    }
                }
            }
        }

        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $imagename:$BUILD_NUMBER"
                sh "docker rmi $imagename:latest"
            }
        }
    }
}
