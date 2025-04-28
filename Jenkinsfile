pipeline {
    agent {
       dockerfile {
            filename 'Dockerfile'
        }
        }
    
    stages {
        stage('Rodar testes') {
            steps {
                sh 'npx cypress run --browser electron'
            }
        }
    }
}
