pipeline {
    agent any

    environment {
        IMAGE_NAME = 'merch-web:latest'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker Image...'
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests to verify container contents...'
                sh 'docker run --rm ${IMAGE_NAME} ls -l /usr/share/nginx/html/index.html'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying application to local Kubernetes cluster...'
                sh 'kubectl apply -f k8s.yaml'
                sh 'kubectl rollout restart deployment merch-web-deployment'
            }
        }
    }
}