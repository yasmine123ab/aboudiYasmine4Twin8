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

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/yasmine123ab/aboudiYasmine4Twin8.git'
            }
        }

        stage('Build Maven') {
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

        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKERHUB_PASS')]) {
                    sh """
                        echo "$DOCKERHUB_PASS" | docker login -u $REGISTRY --password-stdin
                        docker push $REGISTRY/$IMAGE_NAME:$IMAGE_TAG
                    """
                }
            }
        }
    }
}
