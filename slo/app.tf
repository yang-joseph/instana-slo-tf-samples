
## 
# app
resource "instana_application_config" "myAllServices" {
  label               = "myAllServices"
#   label               = "All Services"
  scope               = "INCLUDE_IMMEDIATE_DOWNSTREAM_DATABASE_AND_MESSAGING" 
  boundary_scope      = "INBOUND"  
  tag_filter          = "call.type@na NOT_EMPTY"
}

output "allServicesAppId" {
  value = instana_application_config.myAllServices.id
}

resource "instana_slo_config" "app_1" {
  name = "tfslo_app_timebased_latency_fixed"
  target = 0.91
  tags = ["terraform", "app", "timebased", "latency", "fixed"]
  entity {
    application {
      application_id = instana_application_config.myAllServices.id
      # service_id = "123"
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

#     event_based_latency {
#       threshold = 13.1
#     }

#     time_based_availability {
#       threshold = 14.7
#       aggregation = "MEAN"
#     }

#    event_based_availability {}

#     custom {
#       good_event_filter_expression = "call.erroneous@na EQUALS  false"
#       bad_event_filter_expression = "call.erroneous@na EQUALS  true"
#     }

#     traffic {
#       # traffic_type = "all"
#       traffic_type = "erroneous"
#       threshold = 14
#       aggregation = "SUM"
#     }
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

output "sloConfigId" {
  value = instana_slo_config.app_1.id
}

