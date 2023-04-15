# Note that,
# by default, ELBs don’t allow any incoming or outgoing traffic (just like EC2 Instan‐
# ces), so you need to create a new security group that explicitly allows incoming
# requests on port 80
resource "aws_security_group" "elb" {
  name = "terraform-example-elb"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  # To allow these health check requests, you need to modify the ELB’s security group to
  # allow outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
