
##
# web
resource "instana_website_monitoring_config" "myweb1" {
 name = "myweb1"
}
output "websiteId" {
 value = instana_website_monitoring_config.myweb1.id
}

resource "instana_slo_config" "website_1" {
  name = "tfslo_website_timebased_latency_fixed"
  target = 0.91
  tags = ["terraform", "web", "timebased", "latency", "fixed"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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

output "sloConfigId_web_1" {
  value = instana_slo_config.website_1
}

