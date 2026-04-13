pipeline {
    agent any
    environment {
        IMAGE_NAME = 'merch-web:latest'
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
        // REPLACE 'sudha' with your actual Windows username below
        KUBE_CONFIG = 'C:\\Users\\sudha\\.kube\\config'
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
                echo 'Deploying to Kubernetes...'
                // Using the absolute path to your local kubeconfig
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --kubeconfig=\"${KUBE_CONFIG}\""
                
                echo 'Refreshing deployment...'
                bat "\"${DOCKER_PATH}\\kubectl.exe\" rollout restart deployment merch-web-deployment --kubeconfig=\"${KUBE_CONFIG}\""
            }
        }
    }
}
