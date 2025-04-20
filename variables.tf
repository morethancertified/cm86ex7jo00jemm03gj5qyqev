variable "project" {
  type        = string
  description = "The project name"
  default     = "infrastructure"
}

variable "env" {
  type        = string
  description = "The environment (dev or prod)"
  default     = "dev"
}