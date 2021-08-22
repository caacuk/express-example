pipeline {
    agent { docker { image 'node:14-alpine' } }
    stages {
        stage('install') {
            steps {
                sh 'yarn install'
            }
        }
        
        stage('build') {
            steps {
                sh 'npm --version'
            }
        }
    }
}
