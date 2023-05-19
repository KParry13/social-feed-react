pipeline {

    agent any

    environment {
        def nodejsTool = tool name: 'node-20-tool', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        def dockerTool = tool name: 'docker-latest-tool', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
        PATH = "${nodejsTool}/bin:${dockerTool}/bin:${env.PATH}"
    }

    stages{

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Create Optimized React Build') {
            steps {
                sh 'npm run-script build'
            }
        }

        stage('Build Docker Image') {
            steps{
                sh '''
                    docker build -t kparry/social-feed-react:1.0 .
                    docker images
                '''
            }
        }

        // stage('Push Docker Image') {
        //     steps{
        //         sh 'echo"Pushing docker image..."'
        //     }
        // }

        // stage('Deploy New Image to AWS EC2') {
        //     steps{
        //         sh 'echo "Deploying new image..."'
        //     }
        // }

    }
}