pipeline {
    // agent { dockerfile true }
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'rails --version'
                sh 'node --version'
            }
        }
    }
}