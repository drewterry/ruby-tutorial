pipeline {
  agent any
  stages {
    stage('Prepare Container'){
      steps {
        sh 'docker-compose -f jenkins-compose.yml build'
        sh 'docker-compose -f jenkins-compose.yml run web rails db:setup'
      }
    }
    
    stage('Test') {
      steps {
        sh 'docker-compose -f jenkins-compose.yml run web cat /blog/app/views/welcome/index.html.erb'
        sh 'docker-compose -f jenkins-compose.yml up -d'
        sh 'docker-compose -f jenkins-compose.yml down'
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