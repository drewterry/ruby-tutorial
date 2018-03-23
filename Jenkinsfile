pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh 'pwd'
        sh 'docker-compose up'
        sh 'docker-compose down'
        sh 'docker ps'
      }
    }
    stage('Deploy to Heroku') {
      steps {
        withCredentials(bindings: [[$class: 'StringBinding', credentialsId: 'heroku-registry', variable: 'API_KEY']]) {
          sh 'docker login --username=_ --password=$API_KEY registry.heroku.com'
        }
        
        sh 'docker push registry.heroku.com/dt-rails-blog/web'
      }
    }
  }
}