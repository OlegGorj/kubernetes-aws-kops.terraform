//
//  this tf module is to be replaced with generic vpc module
//

resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags                 = "${merge(map("Name", "${var.name}-${var.env}-vpc"), var.tags)}"
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags   = "${merge(map("Name", "${var.name}-${var.env}-ig"), var.tags)}"
}




output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

output "cidr_block" {
  value = "${aws_vpc.default.cidr_block}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.default.id}"
}
