pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('Test') {
      steps {
        sh '
            cd /
            ls
            cd blog
            ls
        '
      }
    }
    stage('Deploy to Heroku') {
      agent none
      steps {
        sh 'heroku container:push web'
      }
    }
  }
}