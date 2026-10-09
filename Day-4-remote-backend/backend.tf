terraform {
  backend "s3" {
    bucket = "ecommerce-dev-product-assets-amulya"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}