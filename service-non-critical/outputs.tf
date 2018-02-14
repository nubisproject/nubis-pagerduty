output "service_id" {
  value = "${pagerduty_service.service.id}"
}

output "service_integration_key" {
  value = "${pagerduty_service_integration.integration.integration_key}"
}
