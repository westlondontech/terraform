resource "template_file" "slack-register_task" {
  template = "${file("task-definitions/slack-register.json")}"
  
  vars {
    slack_api_key = "${var.slack_api_key}"
  }
}
