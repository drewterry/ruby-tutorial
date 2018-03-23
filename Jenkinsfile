pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh 'docker-compose run web ls /blog'
        sh 'docker-compose up -d'
        sh 'docker-compose down'
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