pipeline {
    agent {
        dockerfile {
            image 'cypress/included:14.3.0'
            args '--entrypoint=""'
        }
    }

    stages {
        stage('Rodar testes') {
            steps {
                sh 'npx cypress run'
            }
        }
    }
}
