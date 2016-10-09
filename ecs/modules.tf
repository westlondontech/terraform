module "service-slack-register" {
  source = "./services/slack-register"

  ecs_role = "${aws_iam_role.ecs_role.arn}"
  vpc_main = "${var.vpc_id}"
  vpc_subnets = "${var.vpc_subnets}"
  route_53_id = "${var.route_53_id}"
  ecs_cluster_name = "${var.ecs_cluster_name}"
  slack_api_key = "${var.slack_api_key}"
}
