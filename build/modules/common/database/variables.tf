variable "server_name" {
  description = "SQL Server name"
  default     = "core-sql-server"
}
variable "database_name" {
  description = "SQL Database name"
  default     = "core-db"
}
variable "location" {
  description = "The Azure location where all resources in this example should be created"
}
variable "resource_group_name" {
  description = "App service name"
}

