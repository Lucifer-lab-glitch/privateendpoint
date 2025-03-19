#  Private Endpoint Name
variable "name" {
  type        = string
  description = "The name of the private endpoint."
}

#  Location
variable "location" {
  type        = string
  description = "The location of the private endpoint."
}

#  Resource Group Name
variable "resource_group_name" {
  type        = string
  description = "The resource group in which the private endpoint will be created."
}

#  Subnet ID
variable "subnet_resource_id" {
  type        = string
  description = "The subnet ID where the private endpoint should be deployed."
}

#  Network Interface Name
variable "network_interface_name" {
  type        = string
  default     = null
  description = "The name of the network interface associated with the private endpoint."
}

#  Private Service Connection Name
variable "private_service_connection_name" {
  type        = string
  description = "The name of the private service connection."
}

#  Private Connection Resource ID
variable "private_connection_resource_id" {
  type        = string
  description = "The resource ID of the private connection."
}

#  Subresource Names (Configurable)
variable "subresource_names" {
  type        = list(string)
  description = "List of subresources to create Private Endpoints for (e.g., `blob`, `file`, `queue`, `table`)."
}

#  Tags
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to apply to the private endpoint."
}

#  Enable or Disable Private DNS Zone Management
variable "private_dns_zone_manage" {
  type        = bool
  default     = true
  description = "Boolean flag to determine if Private DNS Zone should be managed."
}

#  Private DNS Zone Group Name
variable "private_dns_zone_group_name" {
  type        = string
  default     = "default"
  description = "Name of the Private DNS Zone Group."
}

#  Private DNS Zone Resource IDs
variable "private_dns_zone_resource_ids" {
  type        = list(string)
  default     = []
  description = "List of Private DNS Zone Resource IDs."
}

#  IP Configurations for Private Endpoint
variable "ip_configurations" {
  type = list(object({
    name               = string
    private_ip_address = optional(string, null)
    member_name        = optional(string, null)
    subresource_name   = optional(string, null)
  }))
  default     = []
  description = "List of IP configurations for the Private Endpoint."
}

#  Application Security Group Associations (Optional)
variable "application_security_group_association_ids" {
  type        = list(string)
  default     = []
  description = "List of Application Security Group IDs to associate with the Private Endpoint."
}
