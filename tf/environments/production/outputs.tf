output "bucket_name" {
  value = module.tfstate_bucket.bucket_name
}

output "bucket_domain" {
  value = module.tfstate_bucket.bucket_domain_name
}
output "postgresql_users" {
  value = module.postgresql.owners_data  
  sensitive = true
}
