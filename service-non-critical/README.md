# Pagerduty non critical service module
This module creates a non critical pagerduty service module

## How to create a non critical service
Example:

```bash
module "service_non_critical" {
    source                  = "github.com/nubisproject/nubis-pagerduty//service-non-critical?ref=develop
    team_name               = "webops"
    service_name            = "application"
    escalation_policy_name  = "name-of-your-escalation-policy"
}
```

### Inputs and outputs
Inputs:
 * team_name: Name of your team, example: webops, voice. This defaults to "team"
 * service_name: Just an identifier, should just use either application or platform
 * escalation_policy_name: Name of your escalation policy
 * integration: The name of the integration, defaults to "prometheus"

Outputs:
 * service_id: The ID of the pagerduty service
 * service_integration_key: Your integration key, integration defaults to prometheus
