provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_security_group_rule" "my-rule" {
    type        = "ingress"
    from_port         = 0
    to_port           = 65535
    protocol          = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "test"
}

resource "aws_alb_listener" "my-alb-listener"{
    load_balancer_arn = "test"
    port     = "80"
    protocol = "HTTP"
    default_action {
    type             = "forward"
    target_group_arn = "test"
  }
}