/* template files for registry and ecs role policies */
resource "template_file" "ecs_service_role_policy" {
  template = "${file("policies/ecs-service-role-policy.json")}"
}
