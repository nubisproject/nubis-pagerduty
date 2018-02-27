# Pagerduty service module

This module creates a pagerduty service module, it will create a critical and
non critical service.

## How to create a service

Example:

```bash
module "service_critical" {
    source                  = "github.com/nubisproject/nubis-pagerduty//service?ref=develop
    enable_pagerduty        = true
    team_name               = "webops"
    service_name            = "application"
    escalation_policy_name  = "name-of-your-escalation-policy"
}
```

### Inputs and outputs

Inputs:

* `enable_pagerduty`: Enables pagerduty service. This defaults to `false`
* `team_name`: Name of your team, example: webops, voice. This defaults to `team`
* `service_name`: Just an identifier, should just use either `application` or `platform`
* `escalation_policy_name`: Name of your escalation policy
* `integration`: The name of the integration, defaults to `prometheus`

Outputs:

* `service_id_critical`: The ID of the pagerduty service
* `service_integration_key_critical`: Integration key. Default `prometheus`
* `service_id_non_critical`: The ID of the pagerduty service
* `service_integration_key_non_critical`: Integration key. Default `prometheus`
