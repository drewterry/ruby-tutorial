pipeline {
  agent any
  stages {
    stage('Prepare Container'){
      steps {
        sh 'docker-compose -f jenkins-compose.yml build'
        sh 'docker-compose -f jenkins-compose.yml run web rails db:setup'
        sh 'docker images'
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
        
        // This isn't the most efficient, but it should be cached from the docker-compose build
        // and trying to get the name of the original image is complicated.
        sh 'docker build -t registry.heroku.com/dt-rails-blog/web .'
        sh 'docker push registry.heroku.com/dt-rails-blog/web'
      }
    }
  }
}