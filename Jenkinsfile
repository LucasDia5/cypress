pipeline {
    agent any   
 
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
 
         stage('Build') {
             steps {
                 nodejs(nodeJSInstallationName: 'Node 18', configId: '<config-file-provider-id>') {
                     sh 'npm config ls'
                 }
             }
         }
 
         stage('Install dependencies') {
             steps {
                 sh 'npm install --save-dev mochawesome mochawesome-merge mochawesome-report-generator'
 
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
