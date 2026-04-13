pipeline {
    agent any
    environment {
        IMAGE_NAME = 'merch-web:latest'
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                bat "\"${DOCKER_PATH}\\docker.exe\" build -t ${IMAGE_NAME} ."
            }
        }
        stage('Test') {
            steps {
                bat "\"${DOCKER_PATH}\\docker.exe\" run --rm ${IMAGE_NAME} ls -l /usr/share/nginx/html/index.html"
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying using config from workspace...'
                // %WORKSPACE% is a built-in variable Jenkins always understands
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --kubeconfig=\"%WORKSPACE%\\config\""
                
                echo 'Restarting deployment...'
                bat "\"${DOCKER_PATH}\\kubectl.exe\" rollout restart deployment merch-web-deployment --kubeconfig=\"%WORKSPACE%\\config\""
            }
        }
    }
}
