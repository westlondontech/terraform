variable "ssl_arn" {
  description = "Arn for the SSL certificate to use"
  default = "arn:aws:acm:eu-west-1:383909802591:certificate/1a0bd2f6-f1de-443d-9441-6d763b28ecc5"
}

variable "ecs_role" {} 
variable "vpc_main" {}
variable "vpc_subnets" {}
variable "route_53_id" {}
variable "ecs_cluster_name" {}
variable "slack_api_key" {}
