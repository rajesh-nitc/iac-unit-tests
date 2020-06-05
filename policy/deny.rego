package main

has_field(obj, field) {
    obj[field]
}

deny[msg] {
    proto := input.resource.aws_alb_listener[lb].protocol
    proto == "HTTP"
    msg = sprintf("ALB `%v` is using HTTP rather than HTTPS", [lb])
}

deny[msg] {
    rule := input.resource.aws_security_group_rule[name]
    rule.type == "ingress"
    contains(rule.cidr_blocks[_], "0.0.0.0/0") 
    msg = sprintf("ASG `%v` defines a fully open ingress", [name])
}