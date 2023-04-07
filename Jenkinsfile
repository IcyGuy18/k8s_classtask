pipeline {
    agent any
    
    environment {

        PATH = "C:\\WINDOWS\\SYSTEM32;C:\\Program Files\\Docker\\Docker\\resources\\bin"
    }

    stages {    
        
        stage('Step 1') {
            steps {
                script{
                    dockerImage = docker.build("icyguy/k8s_classtask:latest")
                    if (dockerImage) {
                        withDockerRegistry([credentialsId: "dockerhub", url: ""]) {
                            dockerImage.push()
                        }
                    } else {
                        error "Docker image build failed."
                    }
                }
            }
        }
        
        stage('Step 2') {
            steps {
                script {
                    // Delete the previous profiles
                    bat "minikube delete --all"
                    // Start Minikube
                    bat "minikube start --force-systemd"
                    // Create the service and deployment for Kubernetes
                    bat "kubectl apply -f Kubernetes.yml"
                    // Get the pods list
                    bat "kubectl get pods"
                    // Get the running service
                    bat "kubectl get svc"
                    // For accessing the application in your localhost browser
                    //bat "minikube service flask-service"
                    bat "minikube service flask-service --url"
                }
            }
        }
        
    }
}
