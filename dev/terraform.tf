terraform {
  backend "s3" {
    bucket  		= "s3-terraform-state-dev-projectname"
    dynamodb_table 	= "dmdb-terraform-state-lock-dev-projectname"
    key     		= "terraform.tfstate"
    region  		= "us-east-1"
    encrypt 		= "true"
    profile 		= "default"
  }
}
