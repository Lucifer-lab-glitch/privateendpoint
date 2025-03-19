resource "azurerm_private_endpoint" "this" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  subnet_id                     = var.subnet_resource_id
  custom_network_interface_name = var.network_interface_name
  tags                          = var.tags

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection           = false
  }

  #  IP Configurations - Ensure it's handled properly
  dynamic "ip_configuration" {
    for_each = length(var.ip_configurations) > 0 ? var.ip_configurations : []

    content {
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      member_name        = ip_configuration.value.member_name
      subresource_name   = ip_configuration.value.subresource_name
    }
  }

  # Private DNS Zone Group (Optional)
  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_manage ? ["enabled"] : []

    content {
      name                 = var.private_dns_zone_group_name
      private_dns_zone_ids = var.private_dns_zone_resource_ids
    }
  }
}

#  Associate Private Endpoint with Application Security Groups (ASGs) (Optional)
resource "azurerm_private_endpoint_application_security_group_association" "this" {
  for_each = length(var.application_security_group_association_ids) > 0 ? var.application_security_group_association_ids : {}

  application_security_group_id = each.value
  private_endpoint_id           = azurerm_private_endpoint.this.id
}
