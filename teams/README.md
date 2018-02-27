# Teams

Just creates a team, doesn't do much

## Usage

Example:

```bash
module "team_nubis" {
    source              = "github.com/nubisproject/nubis-pagerduty//team?ref=develop"
    pagerduty_team_name = "example"
    pagerduty_users     = [ 'user1@example.com' ]
}
```
