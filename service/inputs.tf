variable "enable_pagerduty" {
  default = false
}

variable "integration" {
  default = "prometheus"
}

variable "team_name" {
  default = "team"
}

variable "service_name" {
  default = "platform"
}

variable "auto_resolve_timeout_critical" {
  default = "null"
}

variable "acknowledgement_timeout_critical" {
  default = "null"
}

variable "auto_resolve_timeout_non_critical" {
  default = "1800"
}

variable "acknowledgement_timeout_non_critical" {
  default = "14400"
}

variable "escalation_policy_critical" {
  default = "nubis"
}

variable "escalation_policy_non_critical" {
  default = "nubis"
}
