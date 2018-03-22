pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('Test') {
      steps {
        sh 'cd / &&             ls &&             cd blog &&             ls'
      }
    }
    stage('Deploy to Heroku') {
      agent {
        node {
          label 'deploy'
        }
        
      }
      steps {
        sh 'heroku container:push web'
      }
    }
  }
}