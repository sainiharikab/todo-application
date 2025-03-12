pipeline {
   agent any

  environment {
      GITHUB_REPO = "https://github.com/sainiharikab/todo-application.git"
      GITHUB_CREDENTIALS = 'github-credentials-id"
}

stages {
   stage('Checkout') {
      steps {
          // Checkout the repository from Github
         git credentialsId: "${GITHUB_CREDENTIALS}", url: "{$ GITHUB_REPO}"
      }
   }


stage('Build') {
   steps {
       // Build the project using maven
       script {
          sh 'mvn clean install'
      }
   }
}

stage('Docker Build & Push') {
   steps {
       // Build and push Docker image
       script {
           sh 'docker build -t sainiharika/todo-appllcation:latest .'
           sh 'docker push sainiharika/todo-application:latest'
     }
  }
}

stage('Deploy') {
   steps {
      // Deploy the application
      script {
          sh 'docker run -d -p 8082:8081 sainiharika/todo-application:latest'
     }
  }
}
}
}
