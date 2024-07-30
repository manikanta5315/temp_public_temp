pipeline {
    agent any
    stages {
        stage('checkout') {
            git branch: 'master' , url: 'https://github.com/manikanta5315/temp_public_temp.git'
        }
        stage('create') {
            bat '''
            docker build -t sampleimage .
            docker run -d --name samplecontainer1 -p 8071:80 -v newvolume:/var/www/html sampleimage sleepinfinity
            docker tag sampleimage manikanta5315/newsampleproject
            '''
        }
        stage('push') {
            
            withCredentials([usernamePassword(credentialsId: 'manikanta5315-dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
            bat 'echo %password% | docker login -u %username% -p %password%'
            bat 'docker push manikanta5315/newsampleproject'
        }


        }
    }
}