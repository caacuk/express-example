pipeline {
    environment {
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
            dockerImage = docker.build "caacuk/express_example"
        }
        
        stage('deploy image') {
            docker.withRegistry( '', "1" ) {
                dockerImage.push("$BUILD_NUMBER")
                dockerImage.push('latest') 
            }
        }
    }
}
