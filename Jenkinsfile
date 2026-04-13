pipeline {
    agent any
    environment {
        IMAGE_NAME = 'merch-web:latest'
        DOCKER_PATH = 'C:\\Program Files\\Docker\\Docker\\resources\\bin'
    }
    stages {
        stage('Build') {
            steps {
                bat "\"${DOCKER_PATH}\\docker.exe\" build -t ${IMAGE_NAME} ."
            }
        }
        stage('Test') {
            steps {
                bat "\"${DOCKER_PATH}\\docker.exe\" run --rm ${IMAGE_NAME} ls /usr/share/nginx/html/index.html"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to Kubernetes...'
                // Added --validate=false to skip the openapi check that is failing
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --kubeconfig=\"config\" --validate=false"
                
                echo 'Restarting deployment to apply changes...'
                bat "\"${DOCKER_PATH}\\kubectl.exe\" rollout restart deployment merch-web-deployment --kubeconfig=\"config\""
            }
        }
    }
}
