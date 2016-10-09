resource "aws_alb" "slack-registerALB" {
  name    = "slack-register-alb"
  subnets = ["${split(",", var.vpc_subnets)}"]

  tags {
    Name = "slack-register-alb"
  }
}

resource "aws_alb_target_group" "front_end" {
  name = "slack-register-group"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${var.vpc_main}"

  health_check {
    port = "3000"
  }
}

resource "aws_alb_listener" "front_end_ssl" {
   load_balancer_arn = "${aws_alb.slack-registerALB.arn}"
   port = "443"
   protocol = "HTTPS"
   ssl_policy = "ELBSecurityPolicy-2015-05"
   certificate_arn = "${var.ssl_arn}"

   default_action {
     target_group_arn = "${aws_alb_target_group.front_end.arn}"
     type = "forward"
   }
}

resource "aws_alb_listener" "front_end" {
   load_balancer_arn = "${aws_alb.slack-registerALB.arn}"
   port = "80"
   protocol = "HTTP"

   default_action {
     target_group_arn = "${aws_alb_target_group.front_end.arn}"
     type = "forward"
   }
}

resource "aws_route53_record" "slack-register" {
  zone_id = "${var.route_53_id}"
  name = "register.westlondontech.com"
  type = "A"

  alias {
    name = "${aws_alb.slack-registerALB.dns_name}"
    zone_id = "${aws_alb.slack-registerALB.zone_id}"
    evaluate_target_health = true
  }
}


/* container and task definitions for running the actual Docker registry */
resource "aws_ecs_service" "slack-registerService" {
  name            = "slack-register-service"
  cluster         = "${var.ecs_cluster_name}"
  task_definition = "${aws_ecs_task_definition.slack-registerTask.arn}"
  desired_count   = 1
  iam_role        = "${var.ecs_role}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.front_end.arn}"
    container_name   = "slack-register"
    container_port   = 3000
  }
}

resource "aws_ecs_task_definition" "slack-registerTask" {
  family                = "slack-register"
  container_definitions = "${template_file.slack-register_task.rendered}"
}
