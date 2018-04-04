output "service_id_critical" {
  value = "${element(concat(pagerduty_service.service-critical.*.id, list("")),0)}"
}

output "service_id_non_critical" {
  value = "${element(concat(pagerduty_service.service-non-critical.*.id, list("")),0)}"
}

output "service_integration_key_critical" {
  value = "${element(concat(pagerduty_service_integration.integration-critical.*.integration_key, list("")),0)}"
}

output "service_integration_key_non_critical" {
  value = "${element(concat(pagerduty_service_integration.integration-non-critical.*.integration_key, list("")),0)}"
}
