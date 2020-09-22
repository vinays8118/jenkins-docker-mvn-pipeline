pipeline {
  
  environment {
    registry = "vinays8118/gitclient"
    registryCredential = 'dockerhub'
  } 

    agent any
      
    stages {

        stage('Build') {
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
                '''
            }
        }

        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
        }


 stage('Push') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
              sh './jenkins/push/push.sh'
            
          }
        }
      }
     }

       stage ('invoke_terraform_pipeline') {
           steps {
                   build job: 'pipeline2'
               }
        } 

    }
}
