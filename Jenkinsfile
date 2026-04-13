pipeline {
    agent any
    environment {
        IMAGE_NAME = 'merch-web:latest'
        // Point Jenkins directly to the Docker and Kubectl folder
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker Image...'
                // Using the full path to call docker.exe
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
                // Added --kubeconfig=config to point to the local file you just pasted
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --kubeconfig=config"
            }
        }

    }
}
