data "pagerduty_vendor" "integration" {
  name  = "${var.integration}"
}

data "pagerduty_escalation_policy" "escalation_policy" {
  name  = "${var.escalation_policy_name}"
}

resource "pagerduty_service" "service-critical" {
  count                   = "${var.create_service_critical ? 1 : 0}"
  name                    = "nubis-${var.team_name}-${var.service_name}-critical"
  description             = "Managed by terraform - service nubis-${var.team_name}-${var.service_name}-critical"
  auto_resolve_timeout    = "${var.auto_resolve_timeout_critical}"
  acknowledgement_timeout = "${var.acknowledgement_timeout_critical}"
  escalation_policy       = "${data.pagerduty_escalation_policy.escalation_policy.id}"

  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
}

resource "pagerduty_service" "service-non-critical" {
  count                   = "${var.create_service_critical ? 0 : 1}"
  name                    = "nubis-${var.team_name}-${var.service_name}-non-critical"
  description             = "Managed by terraform - service nubis-${var.team_name}-${var.service_name}-non-critical"
  auto_resolve_timeout    = "${var.auto_resolve_timeout_non_critical}"
  acknowledgement_timeout = "${var.acknowledgement_timeout_non_critical}"
  escalation_policy       = "${data.pagerduty_escalation_policy.escalation_policy.id}"

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

# Sets up integration with the service
resource "pagerduty_service_integration" "integration-critical" {
  count   = "${var.create_service_critical ? 1 : 0}"
  name    = "${data.pagerduty_vendor.integration.name}"
  service = "${pagerduty_service.service-critical.id}"
  vendor  = "${data.pagerduty_vendor.integration.id}"
}

# Sets up integration with the service
resource "pagerduty_service_integration" "integration-non-critical" {
  count   = "${var.create_service_critical ? 0 : 1}"
  name    = "${data.pagerduty_vendor.integration.name}"
  service = "${pagerduty_service.service-non-critical.id}"
  vendor  = "${data.pagerduty_vendor.integration.id}"
}
