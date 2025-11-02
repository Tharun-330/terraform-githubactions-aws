terraform {
  backend "s3" {
    bucket         = "state-github-bucket-karnati"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    #dynamodb_table = "terraform-lock"
    #encrypt        = true
  }
}
