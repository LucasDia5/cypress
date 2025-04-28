pipeline {
    agent {
        docker {
            image 'cypress/included:14.3.0'
            args '--entrypoint=""'
        }
        }
    
    stages {
        stage('Rodar testes') {
            steps {
                sh 'xvfb-run -a npx cypress run'
            }
        }
    }
}
