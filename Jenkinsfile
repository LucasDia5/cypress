pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            dir '.'
        }
    }

    stages {
        stage('Rodar testes') {
            steps {
                sh 'npm test'
            }
        }
    }
}
