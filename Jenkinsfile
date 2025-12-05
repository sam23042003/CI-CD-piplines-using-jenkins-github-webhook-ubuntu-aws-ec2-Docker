pipeline {
    agent any

    environment {
        CONTAINER_NAME = "nestjs-app"
        IMAGE_NAME = "nestjs-image"
        EMAIL = "smarthmutagekar23work@gmail.com"
        PORT = "3000"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/sam23042003/CI-CD-piplines-using-jenkins-github-webhook-ubuntu-aws-ec2-Docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop & Remove Previous Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Docker Container Run') {
            steps {
                sh '''
                    docker run -d -p ${PORT}:${PORT} --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }

        stage('Send Email Notification') {
            steps {
                emailext(
                    subject: "NestJS App Deployed Successfully on EC2!",
                    body: "Your Nest JS app is Deployed! http://54.242.48.11:${PORT}/",
                    to: "${EMAIL}"
                )
            }
        }
    }
}
