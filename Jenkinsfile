pipeline {
    agent {
        docker {
            image 'cypress/included:14.3.0'
            args '-u root'
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

        stage('Run Cypress Tests') {
            steps {
                sh 'cypress run'
            }
        }
    }
}
