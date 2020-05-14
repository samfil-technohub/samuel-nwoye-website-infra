pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr:'5', artifactNumToKeepStr:'5', artifactDaysToKeepStr:'7'))
    durabilityHint('PERFORMANCE_OPTIMIZED')
    retry(1)
    skipDefaultCheckout()
    timestamps()
  }
  stages {
    stage ('Checkout') {
      // Checkout Repository
      steps {
        checkout([$class:'GitSCM', branches: [[name: '*/release'],[name: '*/develop'],[name: '*/master']], 
        doGenerateSubmoduleConfigurations:false, extensions:[], submoduleCfg:[],
        userRemoteConfigs:[[ credentialsId: 'knoxknot', url:'https://github.com/samfil-technohub/samuel-nwoye-website-infra.git']]])     
      }
    }
    stage ('Initialize') {
      // Export AWS PROFILE and Initialize Terraform
      steps {
        withCredentials([string(credentialsId: 'github-token', variable: 'github-token')]) {
          script {
            env.TF_VAR_github_token="${github-token}"
          }
          sh 'terraform --version'
          sh 'export AWS_PROFILE=knoxknot'
          sh 'terraform init'
          sh ''
        } 
      }
    }
    stage ('Apply') {
      // Apply the Terraform Code
      steps {
        withCredentials([file(credentialsId: 'terraform-inputs', variable: 'terraform.tfvars')]) {
          sh 'terraform validate' 
          sh "terraform apply -var-file=${terraform.tfvars} -auto-approve"
        }
      }
    }
    stage ('Clean Workspace'){
      steps {
        cleanWs()
      }
    }
  }
  post {
    success {
      slackSend (channel: '#mymonitor', color: 'good', message: "*${currentBuild.currentResult}:* _Job_ ${env.JOB_NAME}; _Build_ ${env.BUILD_NUMBER}\n *Visit:* ${env.BUILD_URL}")
    }
    failure {
      slackSend (channel: '#mymonitor', color: 'danger', message: "*${currentBuild.currentResult}:* _Job_ ${env.JOB_NAME}; _Build_ ${env.BUILD_NUMBER}\n *Visit:* ${env.BUILD_URL}")
    }
  }
}