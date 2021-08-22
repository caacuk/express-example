pipeline {
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
        
        stage('build') {
            agent {
                docker {
                    image 'docker:19.03.8-dind'
                    reuseNode true
                }
            }
            steps {
                sh 'docker login -u "caacuk" -p "75ec5b66-d7fb-485c-a7fe-4dace3f9a86e" docker.io'
                sh 'docker build . -t caacuk/express_example:$BUILD_NUMBER'
                sh 'docker push caacuk/express_example:$BUILD_NUMBER'
            }
        }
    }
}
