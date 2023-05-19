pipepline {

    agent any

    

    stages{

        stage('Install Dependencies') {
            steps {

                script {
                    def nodejsTool = tool name: 'node-20-tool', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                    env.PATH = "${nodejsTool}/bin:${env.PATH}"
                }
                sh 'npm install'
                sh 'npm run-script build'
            }
        }

        // stage('Create Optimized React Build') {
        //     steps {
        //         sh 'echo"Creating optimized react build..."'
        //     }
        // }

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