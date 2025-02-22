pipeline {
    agent any
    environment {
        IMAGE_NAME = "prashantecho/iskcon:latest"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Prashantecho/onion.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withDockerRegistry([credentialsId: 'prashant', url: '']) { // FIXED HERE
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stop test || true'
                sh 'docker rm test || true'
                sh 'docker run -d --name test -p 3000:3000 $IMAGE_NAME'
            }
        }
    }
}
