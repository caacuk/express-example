pipeline {
    agent { docker { image 'node:14-alpine' } }
    stages {
        stage ('Pull source code') {
            steps {
                git branch: 'development', 
                credentialsId: '1', 
                poll: false, url: 'https://github.com/caacuk/express-example.git'
            }
        }
        stage('install') {
            steps {
                sh 'npm install'
            }
        }
        
        stage('build') {
            steps {
                sh 'npm --version'
            }
        }
    }
}
