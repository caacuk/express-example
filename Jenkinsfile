pipeline {
    environment {
        imagename = 'caacuk/express_example'
        registryCredential = '1'
        dockerImage = ''
    }
    agent any
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
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest') 
                    }
                }
            }
        }
    }
}
