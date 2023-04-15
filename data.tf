data "template_file" "user-data" {
  template = "${file("${path.module}/user-data.sh")}"
#   vars = {
#     consul_address = "${aws_instance.consul.private_ip}"
#   }
}