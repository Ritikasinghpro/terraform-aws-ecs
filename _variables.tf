variable "name" {
  description = "Name of ECS cluster."
}
variable "container_insights" {
  type        = bool
  default     = true
  description = "Enables CloudWatch Container Insights for a cluster."
}