# We use data provider because users
# are pre-created
data "pagerduty_user" "me" {
  count = "${length(var.pagerduty_users)}"
  email = "${element(var.pagerduty_users, count.index)}"
}

resource "pagerduty_team" "team" {
  name        = "${var.pagerduty_team_name}"
  description = "Terraform managed team - ${var.pagerduty_team_name}"
}

resource "pagerduty_team_membership" "team_member" {

  count   = "${length(var.pagerduty_users)}"

  user_id = "${element(data.pagerduty_user.me.*.id, count.index)}"
  team_id = "${pagerduty_team.team.id}"

}
