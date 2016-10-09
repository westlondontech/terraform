module "service-slack-register" {
  source = "./services/slack-register"

  ecs_role = "${aws_iam_role.ecs_role.arn}"
  subnet_first = "${aws_subnet.first.id}"
  subnet_second = "${aws_subnet.second.id}"
  subnet_third = "${aws_subnet.third.id}"
  route_53_id = "${var.route_53_id}"
  ecs_cluster_name = "${var.ecs_cluster_name}"
}
