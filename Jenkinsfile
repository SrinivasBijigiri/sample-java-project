pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/SrinivasBijigiri/sample-java-project.git'
            }
        }

        stage('Build') {
            steps {
                echo "Build started"
            }
        }
    }
}
