pipeline {
    agent { dockerfile true }
    //agent any
    stages {
        stage('Test') {
            steps {
                sh 'ls'
                sh 'cd blog'
                sh 'ls'
                sh 'rails db:setup'
            }
        }
    }
}