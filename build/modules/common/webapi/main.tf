# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE APPLICATION INSIGHTS FOR CORE API
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
resource "azurerm_application_insights" "app_insights" {
  name                = "${var.name}-insights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE CORE API
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
resource "azurerm_app_service" "api" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  site_config {
    # dotnet_framework_version  = "v4.0"
    remote_debugging_enabled  = true
    remote_debugging_version  = "VS2017"
    always_on                 = false
    use_32_bit_worker_process = true #TODO: for demo purposes in Free App Service Plan (remove this)
    cors {
      allowed_origins = var.cors_allowed_origins
    }
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = azurerm_application_insights.app_insights.instrumentation_key
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    XDT_MicrosoftApplicationInsights_Mode      = "recommended"
    ASPNETCORE_ENVIRONMENT                     = var.aspnet_environment
    WEBSITE_RUN_FROM_PACKAGE                   = "1"

  }

  # connection_string = {
  # name = ""
  # type = ""
  # value = ""  
  # }
}
