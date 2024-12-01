#Create Backend

terraform {
  backend "s3" {
    bucket  = "ennyajax1-bucket"
    key     = "env/project7/terraform.tfstate"
    region  = "eu-west-2"
      }
}