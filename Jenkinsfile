pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh 'docker-compose -v'
      }
    }
    stage('Deploy to Heroku') {
      agent {
        node { }
        
      }
      steps {
        sh 'heroku container:push web'
      }
    }
  }
}