pipeline {
    agent { dockerfile true }
    //agent any
    stages {
        stage('Test') {
            steps {
                sh 'ls blog/tmp'
                sh 'cd blog'
                sh 'rails db:setup'
            }
        }
    }
}