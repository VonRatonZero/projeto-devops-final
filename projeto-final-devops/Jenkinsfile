pipeline {
    agent any

    environment {
        // Troque pelo seu usuário do Docker Hub
        DOCKER_IMAGE = 'vonraton/minha-app-devops'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // O Jenkins baixa o código do GitHub automaticamente aqui
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Constrói a imagem
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Usa as credenciais que criamos no Passo 3 da Fase 4
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }

        stage('Deploy (Simulação)') {
            steps {
                script {
                    // Remove container antigo se existir e roda o novo
                    // O '|| true' serve para não dar erro se for a primeira vez (container não existe)
                    sh "docker stop app-rodando || true"
                    sh "docker rm app-rodando || true"
                    sh "docker run -d -p 3005:3000 --name app-rodando ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }
}