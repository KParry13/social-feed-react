pipepline {

    agent any

    environment {
        def nodejsTool = tool name: 'node-20-tool', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        PATH = "${nodejsTool}/bin:${env.PATH}"
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

        // stage('Build Docker Image') {
        //     steps{
        //         sh 'echo "Building Docker Image..."'
        //     }
        // }

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