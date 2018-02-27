output "service_id_critical" {
  value = "${pagerduty_service.service-critical.id}"
}

output "service_id_non_critical" {
  value = "${pagerduty_service.service-non-critical.id}"
}

output "service_integration_key_critical" {
  value = "${pagerduty_service_integration.integration-critical.integration_key}"
}

output "service_integration_key_non_critical" {
  value = "${pagerduty_service_integration.integration-non-critical.integration_key}"
}
