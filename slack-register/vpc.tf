# Define a vpc
resource "aws_vpc" "slackRegisterVPC" {
  cidr_block = "200.0.0.0/16"
  tags {
    Name = "ecsSlackRegisterVPC"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "slackRegisterIG" {
  vpc_id = "${aws_vpc.slackRegisterVPC.id}"
  tags {
    Name = "ecsSlackRegisterIG"
  }
}

# Public subnet
resource "aws_subnet" "slackRegisterPubSN0-0" {
  vpc_id = "${aws_vpc.slackRegisterVPC.id}"
  cidr_block = "200.0.0.0/24"
  availability_zone = "eu-west-1a"
  tags {
    Name = "ecsSlackRegisterPubSN0-0-0"
  }
}

# Routing table for public subnet
resource "aws_route_table" "slackRegisterPubSN0-0RT" {
  vpc_id = "${aws_vpc.slackRegisterVPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.slackRegisterIG.id}"
  }
  tags {
    Name = "slackRegisterPubSN0-0RT"
  }
}

# Associate the routing table to public subnet
resource "aws_route_table_association" "slackRegisterPubSN0-0RTAssn" {
  subnet_id = "${aws_subnet.slackRegisterPubSN0-0.id}"
  route_table_id = "${aws_route_table.slackRegisterPubSN0-0RT.id}"
}
