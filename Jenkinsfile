pipeline {
    agent any

    options {
        timeout(time: 10, unit: 'MINUTES')
        ansiColor('xterm')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t halkeye/dehydrated .'
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }
            environment {
                DOCKER = credentials('dockerhub-halkeye')
            }
            steps {
                sh 'docker login --username $DOCKER_USR --password=$DOCKER_PSW'
                sh 'docker push halkeye/dehydrated'
            }
        }
    }
    post {
        // https://jenkins.io/blog/2017/02/15/declarative-notifications/
        failure {
            emailext (
                subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
                recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }
    }
}
