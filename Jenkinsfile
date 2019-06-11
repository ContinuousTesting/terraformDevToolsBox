pipeline {
    agent any
environment {
        TERRAFORM_CMD = '/usr/local/bin/terraform'
    }
    stages {

        stage('init') {
            steps {

sh 'cd DevtoolsAWSLinux-ec2-instance && ${TERRAFORM_CMD} init -backend=true -input=false '


            }
        }
        stage('plan') {
            steps {

sh 'cd DevtoolsAWSLinux-ec2-instance && export AWS_SECRET_ACCESS_KEY=$(cat /.aws/key) && export AWS_ACCESS_KEY_ID=$(cat /.aws/keyid)  && ${TERRAFORM_CMD} plan -out=tfplan -input=false '

                script {
                  timeout(time: 10, unit: 'MINUTES') {
                    input(id: "Deploy Gate", message: "Deploy Development Host  on ec2 small ?", ok: 'Deploy')
                  }
                }
            }
        }
        stage('apply') {
            steps {

sh 'cd DevtoolsAWSLinux-ec2-instance && export AWS_SECRET_ACCESS_KEY=$(cat /.aws/key) && export AWS_ACCESS_KEY_ID=$(cat /.aws/keyid) && echo yes | ${TERRAFORM_CMD} apply -lock=false -input=false tfplan && cat terraform.tfstate'

}
        }
    }
}
