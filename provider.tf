provider "aws" {
  region = "${var.region}"
}


backend "s3"
