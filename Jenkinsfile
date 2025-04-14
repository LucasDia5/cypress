pipeline {
    agent any   

    tools {
        nodejs 'Node 21' // O nome que você configurou no Jenkins
    }

 
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
                sh 'npm install'
            }
            }
 
          
         stage('Install dependencies') {
             steps {
                 sh 'npm install cypress --save-dev mochawesome mochawesome-merge mochawesome-report-generator'
 
             }
         }
 
         stage('Install Cypress binary') {
             steps {
                  sh 'npx cypress install'
             }
         }
 
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

