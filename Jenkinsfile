pipeline {
    agent any
 
    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
