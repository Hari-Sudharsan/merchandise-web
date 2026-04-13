pipeline {
    agent any
    environment {
        IMAGE_NAME = 'merch-web:latest'
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
        // REPLACE 'YourUsername' with your actual Windows username
        KUBE_CONFIG = 'C:\\Users\\YourUsername\\.kube\\config'
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
                // We use the --kubeconfig flag to point directly to your user folder
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --kubeconfig=\"${KUBE_CONFIG}\""
                
                echo 'Refreshing deployment...'
                bat "\"${DOCKER_PATH}\\kubectl.exe\" rollout restart deployment merch-web-deployment --kubeconfig=\"${KUBE_CONFIG}\""
            }
        }
    }
}
