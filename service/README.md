# Pagerduty service module

This module creates a pagerduty service module, it will create a non-critical
service by default unless you add a flag `create_service_critical = true`
to the module

## How to create a service

Example:

```bash
module "service_critical" {
    source                  = "github.com/nubisproject/nubis-pagerduty//service?ref=develop
    create_service_critical = true
    team_name               = "webops"
    service_name            = "application"
    escalation_policy_name  = "name-of-your-escalation-policy"
}
```

If non critical just remove `create_service_critical = true` from your module call

### Inputs and outputs

Inputs:

* `create_service_critical`: Creates a critical service or not. Defaults to `false`
* `team_name`: Name of your team, example: webops, voice. This defaults to `team`
* `service_name`: Just an identifier, should just use either `application` or `platform`
* `escalation_policy_name`: Name of your escalation policy
* `integration`: The name of the integration, defaults to `prometheus`

Outputs:

* `service_id`: The ID of the pagerduty service
* `service_integration_key`: Your integration key, integration defaults to prometheus
