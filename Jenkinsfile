pipeline {
    agent {
       dockerfile {
            filename 'Dockerfile'
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
