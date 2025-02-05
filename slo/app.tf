
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
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

resource "instana_slo_config" "app_2" {
  name = "tfslo_app_eventbased_latency_fixed"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "latency", "fixed"]
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
    event_based_latency {
      threshold = 13.1
    }
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

resource "instana_slo_config" "app_3" {
  name = "tfslo_app_timebased_availability_fixed"
  target = 0.91
  tags = ["terraform", "app", "timebased", "availability", "fixed"]
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
    time_based_availability {
      threshold = 14.7
      aggregation = "MEAN"
    }
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

resource "instana_slo_config" "app_4" {
  name = "tfslo_app_eventbased_availability_fixed"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "availability", "fixed"]
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
    event_based_availability {}
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

resource "instana_slo_config" "app_5" {
  name = "tfslo_app_eventbased_custom_fixed"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "custom", "fixed"]
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
    custom {
      good_event_filter_expression = "call.erroneous@na EQUALS  false"
      bad_event_filter_expression = "call.erroneous@na EQUALS  true"
    }
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

resource "instana_slo_config" "app_6" {
  name = "tfslo_app_traffic_all_fixed"
  target = 0.91
  tags = ["terraform", "app", "traffic", "all", "fixed"]
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
    traffic {
      traffic_type = "all"
      threshold = 14
      aggregation = "SUM"
    }
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

resource "instana_slo_config" "app_7" {
  name = "tfslo_app_traffic_erroneous_fixed"
  target = 0.91
  tags = ["terraform", "app", "traffic", "erroneous", "fixed"]
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
    traffic {
      traffic_type = "erroneous"
      threshold = 14
      aggregation = "SUM"
    }
  }
  time_window {
    fixed {
      duration = 1
      duration_unit = "day"
      start_timestamp = 1698552000000
    }
  }
}

##
resource "instana_slo_config" "app_r_1" {
  name = "tfslo_app_r_timebased_latency_rolling"
  target = 0.91
  tags = ["terraform", "app", "timebased", "latency", "rolling"]
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
  }
  time_window {
    rolling {
      duration = 1
      duration_unit = "day"
    }
  }
}

resource "instana_slo_config" "app_r_2" {
  name = "tfslo_app_r_eventbased_latency_rolling"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "latency", "rolling"]
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
    event_based_latency {
      threshold = 13.1
    }
  }
  time_window {
    rolling {
      duration = 1
      duration_unit = "day"
    }
  }
}

resource "instana_slo_config" "app_r_3" {
  name = "tfslo_app_r_timebased_availability_rolling"
  target = 0.91
  tags = ["terraform", "app", "timebased", "availability", "rolling"]
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
    time_based_availability {
      threshold = 14.7
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

resource "instana_slo_config" "app_r_4" {
  name = "tfslo_app_r_eventbased_availability_rolling"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "availability", "rolling"]
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
    event_based_availability {}
  }
  time_window {
    rolling {
      duration = 1
      duration_unit = "day"
    }
  }
}

resource "instana_slo_config" "app_r_5" {
  name = "tfslo_app_r_eventbased_custom_rolling"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "custom", "rolling"]
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
    custom {
      good_event_filter_expression = "call.erroneous@na EQUALS  false"
      bad_event_filter_expression = "call.erroneous@na EQUALS  true"
    }
  }
  time_window {
    rolling {
      duration = 1
      duration_unit = "day"
    }
  }
}

resource "instana_slo_config" "app_r_6" {
  name = "tfslo_app_r_traffic_all_rolling"
  target = 0.91
  tags = ["terraform", "app", "traffic", "all", "rolling"]
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
    traffic {
      traffic_type = "all"
      threshold = 14
      aggregation = "SUM"
    }
  }
  time_window {
    rolling {
      duration = 1
      duration_unit = "day"
    }
  }
}

resource "instana_slo_config" "app_r_7" {
  name = "tfslo_app_r_traffic_erroneous_rolling"
  target = 0.91
  tags = ["terraform", "app", "traffic", "erroneous", "rolling"]
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
    traffic {
      traffic_type = "erroneous"
      threshold = 14
      aggregation = "SUM"
    }
  }
  time_window {
    rolling {
      duration = 1
      duration_unit = "day"
    }
  }
}

##
output "sloConfigId1" {
  value = instana_slo_config.app_1.id
}
output "sloConfigId2" {
  value = instana_slo_config.app_2.id
}
output "sloConfigId3" {
  value = instana_slo_config.app_3.id
}
output "sloConfigId4" {
  value = instana_slo_config.app_4.id
}
output "sloConfigId5" {
  value = instana_slo_config.app_5.id
}
output "sloConfigId6" {
  value = instana_slo_config.app_6.id
}
output "sloConfigId7" {
  value = instana_slo_config.app_7.id
}

