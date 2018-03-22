pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh 'docker-compose -v'
      }
    }
    stage('Deploy to Heroku') {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: '<Heroku>',
        usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        steps {
        
            sh 'echo uname=$USERNAME pwd=$PASSWORD'
        
        sh 'docker login --username=_ --password=$(heroku auth:token) registry.heroku.com'
        sh 'heroku container:push web'
      }
        }
    }
  }
}