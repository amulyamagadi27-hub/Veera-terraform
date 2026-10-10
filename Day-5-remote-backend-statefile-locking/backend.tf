terraform {
  backend "s3" {
    bucket = "day5-amulya"
    key    = "terraform.tfstate"
    use_lockfile = true ##supports terrafrom latest version >=1.10
   # dynamodb_table = "terraform-statefile-locking" ##supports terrafrom below >=1.10 version 
    region = "ap-south-1"
  }
}