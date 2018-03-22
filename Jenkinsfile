pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('Test') {
      steps {
        sh 'echo \'Running Tests\''
      }
    }
    stage('Deploy to Heroku') {
      agent any
      steps {
        sh 'heroku container:push web'
      }
    }
  }
}