data "pagerduty_vendor" "integration" {
  name  = "${var.integration}"
}

data "pagerduty_escalation_policy" "escalation_policy" {
  name  = "${var.escalation_policy_name}"
}

resource "pagerduty_service" "service" {
  name                    = "nubis-${var.team_name}-${var.service_name}-critical"
  description             = "Managed by terraform - service nubis-${var.team_name}-${var.service_name}-critical"
  auto_resolve_timeout    = "${var.auto_resolve_timeout}"
  acknowledgement_timeout = "${var.acknowledgement_timeout}"
  escalation_policy       = "${data.pagerduty_escalation_policy.escalation_policy.id}"

  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }

}

# Sets up integration with the service
resource "pagerduty_service_integration" "integration" {
  name    = "${data.pagerduty_vendor.integration.name}"
  service = "${pagerduty_service.service.id}"
  vendor  = "${data.pagerduty_vendor.integration.id}"
}

