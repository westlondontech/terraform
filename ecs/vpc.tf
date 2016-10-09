resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "NewTech"
  }
}

resource "aws_subnet" "first" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "NewTech"
  }
}

resource "aws_subnet" "second" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/24"

  tags {
    Name = "NewTech"
  }
}

resource "aws_subnet" "third" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.3.0/24"

  tags {
    Name = "NewTech"
  }
}
