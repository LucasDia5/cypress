pipeline {
    agent any

        environment {
        // Caminho padrão do NVM
        NVM_DIR = "${HOME}/.nvm"
    }

    stages {
        stage('Preparar ambiente Node.js') {
            steps {
                sh '''
                    # Carrega o NVM e usa a versão desejada
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

                    nvm install 18
                    nvm use 18
                    node -v
                    npm -v
                '''
            }
        }

        stage('Instalar dependências') {
            steps {
                sh '''
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
                    nvm use 18

                    npm ci || npm install
                    npx cypress install
                '''
            }
        }

        stage('Rodar testes com Cypress') {
            steps {
                sh '''
                    export NVM_DIR="$HOME/.nvm"
                    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
                    nvm use 18

                    npx cypress run
                '''
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
