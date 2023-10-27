pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('kaviraj_admin_SWF_AWS_Test_AccessKey')
        AWS_SECRET_ACCESS_KEY = credentials('kaviraj_admin_SWF_AWS_Test_SecretAccessKey')
    }

    parameters {
        choice(name: 'TerraformAction', choices: ['apply', 'destroy'], description: 'Select Terraform action')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'kravalji_Gitea_aakash', url: 'http://192.168.0.246:3000/Aakash/terraform_automation_projects.git']])
            }
        }
        stage("terraform init") {
            steps {
                script {
                    def terraformPath = 'C:\\terraform_1.6.1_windows_386'
                    def workspacePath = 'C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Terraform_EC2_SWF_Test\\SWF_Projects\\SWF_AWS_Test_Server'
                    
                    dir(workspacePath) {
                        // Change directory to your ElasticBeanstalk folder
                        dir('CreateEC2InstancewithElasticIP_VPC_SG') {
                            bat "${terraformPath}\\terraform init -reconfigure"
                        }
                    }
                }
            }
        }
        stage("terraform plan") {
            steps {
                script {
                    def terraformPath = 'C:\\terraform_1.6.1_windows_386'
                    def workspacePath = 'C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Terraform_EC2_SWF_Test\\SWF_Projects\\SWF_AWS_Test_Server'
                    
                    dir(workspacePath) {
                        // Change directory to your ElasticBeanstalk folder
                        dir('CreateEC2InstancewithElasticIP_VPC_SG') {
                            bat "${terraformPath}\\terraform plan"
                        }
                    }
                }
            }
        }
        stage("terraform Action") {
            steps {
                script {
                    def terraformPath = 'C:\\terraform_1.6.1_windows_386'
                    def workspacePath = 'C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\Terraform_EC2_SWF_Test\\SWF_Projects\\SWF_AWS_Test_Server'
                    def action = params.TerraformAction
                    echo "Terraform action is --> ${action}"
                    
                    dir(workspacePath) {
                        // Change directory to your ElasticBeanstalk folder
                        dir('CreateEC2InstancewithElasticIP_VPC_SG') {
                            if (action == 'apply') {
                                bat "${terraformPath}\\terraform apply --auto-approve"
                            } else if (action == 'destroy') {
                                bat "${terraformPath}\\terraform destroy --auto-approve"
                            } else {
                                error "Invalid Terraform action selected"
                            }
                        }
                    }
                }
            }
        }
    }
}