pipeline {
    agent any
    environment {
        IMAGE_NAME = 'merch-web:latest'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker Image...'
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests to verify container contents...'
                bat "docker run --rm ${IMAGE_NAME} ls -l /usr/share/nginx/html/index.html"
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying application to local Kubernetes cluster...'
                bat "kubectl apply -f k8s.yaml"
                bat "kubectl rollout restart deployment merch-web-deployment"
            }
        }
    }
}