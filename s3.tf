#create instance EC2
resource "aws_instance" "bucket_S3" {
  ami           = "ami-0756283460878b818"  
  instance_type = "t2.micro"
  depends_on = [ aws_s3_bucket.mybucket ]
  tags = {
    Name = "bucket_intance"
  }
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "random1232413"
  
}