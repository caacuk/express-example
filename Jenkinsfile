pipeline {
    environment {
        imagename = 'caacuk/express_example'
        registryUrl = 'docker.io'
        registryCredential = '1'
        dockerImage = ''
    }
    agent none
    stages {
        stage('install') {
            agent { 
                docker { 
                    image 'node:14-alpine' 
                } 
            }
            steps {
                sh 'yarn install'
            }
        }

        stage('build image') {
            steps{
                script {
                    dockerImage = docker.build imagename
                }
            }
        }
        
        stage('push image') {
            steps{
                script {
                    docker.withRegistry( registryUrl, registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest') 
                    }
                }
            }
        }
    }
}
