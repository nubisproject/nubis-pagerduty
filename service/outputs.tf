output "service_id" {
	value = "${element(compact(concat(pagerduty_service.service-critical.*.id, pagerduty_service.service-non-critical.*.id, list(""))), 0)}"
}

output "service_integration_key" {
	value = "${element(compact(concat(pagerduty_service_integration.integration-critical.*.integration_key, pagerduty_service_integration.integration-non-critical.*.integration_key, list(""))), 0)}"
}
