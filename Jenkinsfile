pipeline {
    agent {
        docker {
            image 'cypress/included:13.6.4'
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
                sh 'npx cypress run'
            }
        }
    }
}
