pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            dir '.'
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
