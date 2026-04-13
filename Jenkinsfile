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
                echo 'Running tests to verify container contents...'
                bat "\"${DOCKER_PATH}\\docker.exe\" run --rm ${IMAGE_NAME} ls -l /usr/share/nginx/html/index.html"
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying application to local Kubernetes cluster...'
                // This line looks for the 'config' file you just pushed to GitHub
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --kubeconfig=config"
                echo 'Restarting deployment...'
                bat "\"${DOCKER_PATH}\\kubectl.exe\" rollout restart deployment merch-web-deployment --kubeconfig=config"
            }
        }
    }
}
