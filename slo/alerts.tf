# Entity
resource "instana_application_config" "myAllServices4Alerts" {
  label               = "myAllServices4Alerts"
  scope               = "INCLUDE_IMMEDIATE_DOWNSTREAM_DATABASE_AND_MESSAGING" 
  boundary_scope      = "INBOUND"  
  tag_filter          = "call.type@na NOT_EMPTY"
}

output "allServicesAppId" {
  value = instana_application_config.myAllServices4Alerts.id
}


# SLO
resource "instana_slo_config" "slo4Alert" {
  name = "tfslo_app_timebased_latency_fixed"
  target = 0.91
  tags = ["terraform", "app", "timebased", "latency", "fixed"]
  entity {
    application {
      application_id = instana_application_config.myAllServices4Alerts.id
      boundary_scope = "ALL"
      include_internal = false
      include_synthetic = false
      filter_expression = "AND"
    }
  }
  indicator {
     time_based_latency {
       threshold = 13.1
       aggregation = "MEAN"
     }
  }
  time_window {
    rolling {
      duration = 1
      duration_unit = "day"
    }
  }
}

# Alerts
