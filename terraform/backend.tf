terraform {
  backend "s3" {
    # bucket details for jenkins-tf s3 backend
    bucket         = "dub-jenkins-terraform-state"
    key            = "state/dub-jenkins-terraform.tfstate"
    region         = "eu-west-1"

    # dynamodb details
    dynamodb_table = "jenkins-terraform-state"
    encrypt        = true
  }
}
