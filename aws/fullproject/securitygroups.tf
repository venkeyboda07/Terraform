resource "aws_security_group" "web"{
    name = var.web_security_group.name
    vpc_id = aws_vpc.base.id
    description = var.web_security_group.description
    tags = {
        Name = var.network_info.name
    }
    depends_on = [aws_vpc.base]
}

resource "aws_vpc_security_group_ingress_rule" "web" {
    count = length(var.web_security_group.ingress)
    security_group_id = aws_security_group.web.id

    ip_protocol = var.web_security_group.ingress[count.index].protocol
    from_port = var.web_security_group.ingress[count.index].from_port
    cidr_ipv4 = var.web_security_group.ingress[count.index].cidr_ipv4
    to_port = var.web_security_group.ingress_rules[count.index].to_port
    description = var.web_security_group.ingress_rules[count.index].description
    depends_on = [aws_security_group.web]


}

resource "aws_vpc_security_egress_rule" "web" {
    count = length(var.web_security_group.egress_rules)
    security_group_id = aws_security_group.web.id
    ip_protocol = var.security_group.egress_rules[count.index].ip_protocol
}