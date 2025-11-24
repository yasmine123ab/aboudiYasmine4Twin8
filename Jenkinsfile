pipeline {
    agent any

    tools {
        maven 'M2_HOME'
    }

    environment {
        REGISTRY = "yasmineeab"
        IMAGE_NAME = "student-management"
        IMAGE_TAG = "1.0.0"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/yasmine123ab/aboudiYasmine4Twin8.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                    docker build -t $REGISTRY/$IMAGE_NAME:$IMAGE_TAG .
                """
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $REGISTRY/$IMAGE_NAME:$IMAGE_TAG
                    """
                }
            }
        }
    }
}
