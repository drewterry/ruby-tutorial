pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh 'docker-compose -v'
      }
    }
    stage('Deploy to Heroku') {
      steps {
        withCredentials(bindings: [[$class: 'StringBinding', credentialsId: 'heroku-registry', variable: 'API_KEY']]) {       
            sh 'docker login --username=_ --password=$API_KEY registry.heroku.com'
        }
        sh 'ls'
        sh 'heroku container:push web'
      }
    }
  }
}