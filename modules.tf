module "ecs" {
  source = "./ecs"

  route_53_id = "${module.route53.route_53_id}"
  ecs_cluster_name = "${var.ecs_cluster_name}"
  public_key = "${var.public_key}"
}

module "route53" {
  source = "./route53"
}
