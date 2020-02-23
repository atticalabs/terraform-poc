variable "storage_name" {
  description = "Storage Account Name"
}
variable "container_name" {
  description = "Storage container name"
}
variable "container_access_level" {
  description = "Storage container access level. Options: private, public, blob"
}
variable "location" {
  description = "The Azure location where all resources in this example should be created"
}
variable "resource_group_name" {
  description = "Resource group name"
}
