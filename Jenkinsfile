pipeline {
    agent any

    environment {
        IMAGE_NAME = 'pravalikaa18/jenkins-python-app'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/KyathamRohith/python-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t pravalikaa18/jenkins-python-app:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh "docker push ${env.IMAGE_NAME}:${env.IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                 withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                 sh 'kubectl apply -f k8s-deployment.yaml'
            }
            }
        }
    }
}
