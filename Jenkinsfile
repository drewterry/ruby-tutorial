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
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'd61503b1-d585-47c6-aba0-3118218fcf1d',
          usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {       
            sh 'docker login --username=$USERNAME --password=$PASSWORD registry.heroku.com'
        }
        sh 'heroku container:push web'
      }
    }
  }
}