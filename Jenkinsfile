pipeline {
    agent { dockerfile true }
    //agent any
    stages {
        stage('Test') {
            steps {
                sh 'ls'
                sh 'find / -name Dockerfile'
            }
        }
    }
}