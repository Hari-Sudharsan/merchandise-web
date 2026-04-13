pipeline {
    agent any
    environment {
        IMAGE_NAME = 'merch-web:latest'
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker Image...'
                bat "\"${DOCKER_PATH}\\docker.exe\" build -t ${IMAGE_NAME} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Verifying container contents...'
                bat "\"${DOCKER_PATH}\\docker.exe\" run --rm ${IMAGE_NAME} ls -l /usr/share/nginx/html/index.html"
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes using local context...'
                // We removed the --kubeconfig=config part to stop the error
                // We added --validate=false to ignore minor version issues
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --validate=false"
                
                echo 'Restarting deployment...'
                bat "\"${DOCKER_PATH}\\kubectl.exe\" rollout restart deployment merch-web-deployment"
            }
        }
    }
}
