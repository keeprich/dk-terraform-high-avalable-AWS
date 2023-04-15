output "elb_dns_name" {
  value = aws_elb.example.dns_name
}

# output "s3_bucket_arn" {
#  #value = "${aws_s3_bucket.terraform_state.arn}"

#  value = aws_s3_bucket.terraform-state.arn
# }