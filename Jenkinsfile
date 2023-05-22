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
                sh """
                    docker build -t kparry/social-feed-react:$BUILD_NUMBER .
                    docker images
                """
            }
        }

        stage('Push Docker Image') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'personal-docker-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}'
                }
                sh "docker push kparry/social-feed-react:$BUILD_NUMBER"
            }
        }

        stage('Deploy New Image to AWS EC2') {
            steps{

                sshagent(['music-library-linux-kp-ssh-credentials']) {
                    sh """
                        SSH_COMMAND="ssh -o StrictHostKeyChecking=no ubuntu@3.138.100.51"
                        \$SSH_COMMAND "docker stop hosted-react-app && docker rm hosted-react-app"
                        \$SSH_COMMAND "docker pull kparry/social-feed-react:$BUILD_NUMBER"
                        \$SSH_COMMAND "docker run -d -p 80:80 --name hosted-react-app kparry/social-feed-react:$BUILD_NUMBER"
                    """
                }
            }
        }

    }
}