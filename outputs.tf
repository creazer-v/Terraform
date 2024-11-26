/***** PgSql Output Parameters *****/

output "postgres_instance_address" {
  value       = module.pgsql.instance_address
  description = "Address of the instance"
}

output "postgres_instance_endpoint" {
  value       = module.pgsql.instance_endpoint
  description = "DNS Endpoint of the instance"
}

output "postgres_instance_id" {
  value       = module.pgsql.identifier
  description = "ID of the instance"
}

output "postgres_instance_name" {
  value       = module.pgsql.instance_name
  description = "The Name of the RDS instance"
}

output "postgres_instance_status" {
  value       = module.pgsql.instance_status
  description = "The RDS instance status"
}

