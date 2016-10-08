variable "region" {
  description = "The AWS region to create resources in."
  default = "eu-west-1"
}

variable "availability_zones" {
  description = "The availability zones"
  default = "eu-west-1a,eu-west-1b,eu-west-1c"
}

variable "ecs_cluster_name" {
  description = "The name of the Amazon ECS cluster."
  default = "default"
}

variable "ssl_arn" {
  description = "Arn for the SSL certificate to use"
  default = ""
}

variable "slack_api_key" {
  description = "API key for slack"
}
