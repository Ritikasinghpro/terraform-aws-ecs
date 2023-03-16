variable "name" {
  description = "Name of ECS cluster."
}

variable "container_insights" {
  type        = bool
  default     = true
  description = "Enables CloudWatch Container Insights for a cluster."
}

variable "task_definition" {

}

variable "service" {

}

variable "task-definition-role-name" {
  
}

variable "task-definition-policy-name" {
  
}