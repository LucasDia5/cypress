pipeline {
    agent any   

    /*tools {
        nodejs 'Node 22' // O nome que você configurou no Jenkins
    }*/

 
        stages {
             stage('Checkout') {
                 steps {
                     checkout scm
                 }
             }
 
             stage('Check Node Version') {
                 steps {
                     sh 'node -v && npm -v'
                  }
             }

            stage('Instalar Dependências') {
                steps {
                                    sh 'rm -rf node_modules package-lock.json'
                sh 'npm cache clean --force'
                sh 'npm init -y'
            }
            }
 
          
         stage('Install cypress') {
             steps {
                sh 'npm install cypress --save-dev'
 
             }
         }
 
         /*stage('Install Cypress binary') {
             steps {
                  sh 'npx cypress install'
             }
         }*/
 
         stage('Run Cypress Tests') {
             steps {
                 sh 'npx cypress run --reporter mochawesome' 
             }
         }
     }
 
     post {
         always {
             archiveArtifacts artifacts: 'cypress/screenshots/**/*.png', allowEmptyArchive: true
             archiveArtifacts artifacts: 'cypress/videos/**/*.mp4', allowEmptyArchive: true
         }
     }  
}

