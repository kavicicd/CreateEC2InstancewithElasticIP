# Data source to retrieve the key pair from S3
data "aws_s3_bucket_object" "key_pair_object" {
  bucket = "aws-keypair-terraform" # Replace with your S3 bucket name
  key    = "terraform_jenkins.pem"          # Replace with the key name in the S3 bucket
}
