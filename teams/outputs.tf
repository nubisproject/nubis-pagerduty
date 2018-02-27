output "pagerduty_users" {
  value = ["${data.pagerduty_user.me.*.name}"]
}
