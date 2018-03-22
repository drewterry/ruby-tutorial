pipeline {
    agent { dockerfile true }
    //agent any
    stages {
        stage('Test') {
            steps {
                sh 'ls blog'
                sh 'rails db:setup'
            }
        }
    }
}