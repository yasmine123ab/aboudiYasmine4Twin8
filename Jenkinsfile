pipeline {
    agent any

    tools {
        maven 'M2_HOME'
    }

    stages {
        stage('GIT') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/yasmine123ab/aboudiYasmine4Twin8.git'
            }
        }

        stage('Build (mvn compile)') {
            steps {
                sh 'mvn compile'
            }
        }
    }
}
