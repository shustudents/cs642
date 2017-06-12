terraform {
  backend "s3" {
    bucket = "cs642prod"
    key    = "static_key"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}
