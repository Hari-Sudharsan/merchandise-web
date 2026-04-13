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
                echo 'Creating temporary config and deploying...'
                // 1. Create the config file using the text you copied from Step 1
                // PASTE YOUR COPIED TEXT INSIDE THE SINGLE QUOTES BELOW
                bat '''
                echo apiVersion: v1 > config
                echo clusters: >> config
                echo ... (PASTE THE REST OF YOUR TEXT HERE) ... >> config
                '''
                
                // 2. Run the deployment using that temporary file
                bat "\"${DOCKER_PATH}\\kubectl.exe\" apply -f k8s.yaml --kubeconfig=config"
            }
        }

    }
}
