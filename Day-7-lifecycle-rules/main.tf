resource "aws_instance" "name" {
    ami                    = "ami-0e34b50e714a297f1" #Amazon 202
    instance_type          = "t3.micro"
    tags = {
        Name = "my-instance"
    }
   
#   lifecycle {
#     create_before_destroy = true
#   }

#    lifecycle {
#      prevent_destroy = true #CAUTION: This will prevent the instance from being destroyed. If you try to destroy the instance, Terraform will throw an error and will not destroy the instance. You need to remove this line to destroy the instance.
#    }
    lifecycle {
    ignore_changes = [tags] #not overriding the tags if we change the tags in the code. It will not destroy the instance and create a new one. It will just ignore the changes in the tags.
  }
}