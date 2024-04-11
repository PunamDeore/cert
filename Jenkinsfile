pipeline {
    agent any
    
    stages {
        stage('Clone repository') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/PunamDeore/cert.git']]])
                    sh 'ls -lrt'
                    if (fileExists('Dockerfile')) {
                        echo "Clone was successful"
                    } else {
                        error "Clone failed"
                    }
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Step 2: Building Docker image from Dockerfile"
                    sh 'pwd'
                    sh 'docker build -t certificate .'
                    sh 'docker images'
                    echo "Docker image created successfully"
                }
            }
        }
        
        stage('Deploy Docker Image') {
            steps {
                script {
                    echo "Step 3: Deploying Docker image"
                    sh 'docker run -d -p 80:80 certificate'
                }
            }
        }
    }
}

def fileExists(filePath) {
    return file(filePath).exists()
}
