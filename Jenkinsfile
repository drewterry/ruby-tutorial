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
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: '<Heroku>',
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          sh 'echo uname=$USERNAME pwd=$PASSWORD'
        }
        
        sh 'docker login --username=_ --password=$(heroku auth:token) registry.heroku.com'
        sh 'heroku container:push web'
      }
    }
  }
}