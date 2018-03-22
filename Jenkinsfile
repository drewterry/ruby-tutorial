pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('Test') {
      steps {
        sh 'cd /blog && rails db:setup'
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