pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'rails --version'
                sh 'node --version'
            }
        }
    }
}