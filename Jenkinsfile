pipeline {
    agent {
        docker {
            image 'cypress/browsers:node-18.12.0-chrome-106'
            args '-u root' // evita erros de permissão no container
        }
    }

    environment {
        HOME = '/tmp' // evita erros com cache
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

        stage('Install dependencies') {
            steps {
                sh 'npm ci || npm install'
            }
        }

        stage('Install Cypress binary') {
            steps {
                sh 'npx cypress install'
            }
        }

        stage('Run Cypress Tests') {
            steps {
                sh 'npx cypress run'
            }
        }
    }
}
