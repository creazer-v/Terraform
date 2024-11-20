output "name" {
  value = replace(lower(local.username), "/[^a-z0-9]+/", "_")
  description = "The HA Id of the user who triggered the apply"
}