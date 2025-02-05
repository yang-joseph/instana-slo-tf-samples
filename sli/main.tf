provider "instana" {
  api_token = "RHITewFDSbykIbrPfCZLEQ"  
  endpoint = "local-instana.pink.instana.rocks:4000"
  tls_skip_verify = true
}

## 
# app
resource "instana_application_config" "allServices" {
  label               = "allServices1"
  scope               = "INCLUDE_IMMEDIATE_DOWNSTREAM_DATABASE_AND_MESSAGING" 
  boundary_scope      = "INBOUND"  
  tag_filter          = "call.type@na NOT_EMPTY"
}

output "allServicesAppId" {
  value = instana_application_config.allServices.id
}

resource "instana_sli_config" "sli_app_time" {
    name = "terraform_sli_app_time"
    initial_evaluation_timestamp = 0
    metric_configuration {
        metric_name = "latency"
        aggregation = "MEAN"
        threshold   = 101
    }
    sli_entity {
      application_time_based {
        application_id = instana_application_config.allServices.id
        boundary_scope = "ALL"
      }
    }
}
#  
# resource "instana_sli_config" "sli_app_event" {
#     name = "terraform_sli_app_event"
#     initial_evaluation_timestamp = 0
#     sli_entity {
#         application_event_based {
#           application_id = instana_application_config.allServices.id
#           boundary_scope = "ALL"
#           good_event_filter_expression = "call.erroneous@na EQUALS false"
#           bad_event_filter_expression = "call.erroneous@na EQUALS true"
#         }
#     }
# }

 
##
# web
# resource "instana_website_monitoring_config" "myweb1" {
#   name = "myweb1"
# }
# 
# output "websiteId" {
#   value = instana_website_monitoring_config.myweb1.id
# }

# resource "instana_sli_config" "sli_web_time" {
#     name = "terraform_sli_web_time"
#     initial_evaluation_timestamp = 0
#     metric_configuration {
#         metric_name = "beaconDuration"
#         aggregation = "MEAN"
#         threshold   = 101
#     }
#     sli_entity {
#       website_time_based {
#         website_id = instana_website_monitoring_config.myweb1.id
#         beacon_type = "httpRequest"
#       }
#     }
# }


#resource "instana_slo_config" "sli_web_event" {
#    name = "terraform_sli_web_event"
#    initial_evaluation_timestamp = 0
#    sli_entity {
#      website_event_based {
#        website_id = instana_website_monitoring_config.myweb1.id
#        beacon_type = "httpRequest"
#        good_event_filter_expression = "beacon.erroneous@na EQUALS false"
#        bad_event_filter_expression = "beacon.erroneous@na EQUALS true"
#      }
#    }
#}



