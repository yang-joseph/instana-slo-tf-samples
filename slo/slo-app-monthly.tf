## 
# app
# resource "instana_application_config" "myAllServices" {
#   label               = "myAllServices"
# #   label               = "All Services"
#   scope               = "INCLUDE_IMMEDIATE_DOWNSTREAM_DATABASE_AND_MESSAGING" 
#   boundary_scope      = "INBOUND"  
#   tag_filter          = "call.type@na NOT_EMPTY"
# }


resource "instana_slo_config" "app_m_1" {
  name = "tfslo_app_monthly_timebased_latency_fixed"
  target = 0.91
  tags = ["terraform", "app", "timebased", "latency", "fixed"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}

resource "instana_slo_config" "app_m_2" {
  name = "tfslo_app_monthly_eventbased_latency_fixed"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "latency", "fixed"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}

resource "instana_slo_config" "app_m_3" {
  name = "tfslo_app_monthly_timebased_availability_fixed"
  target = 0.91
  tags = ["terraform", "app", "timebased", "availability", "fixed"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}

resource "instana_slo_config" "app_m_4" {
  name = "tfslo_app_monthly_eventbased_availability_fixed"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "availability", "fixed"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}

resource "instana_slo_config" "app_m_5" {
  name = "tfslo_app_monthly_eventbased_custom_fixed"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "custom", "fixed"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}

resource "instana_slo_config" "app_m_6" {
  name = "tfslo_app_monthly_traffic_all_fixed"
  target = 0.91
  tags = ["terraform", "app", "traffic", "all", "fixed"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}

resource "instana_slo_config" "app_m_7" {
  name = "tfslo_app_monthly_traffic_erroneous_fixed"
  target = 0.91
  tags = ["terraform", "app", "traffic", "erroneous", "fixed"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}

##
resource "instana_slo_config" "app_m_r_1" {
  name = "tfslo_app_monthly_r_timebased_latency_rolling"
  target = 0.91
  tags = ["terraform", "app", "timebased", "latency", "rolling"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
    }
  }
}

resource "instana_slo_config" "app_m_r_2" {
  name = "tfslo_app_monthly_r_eventbased_latency_rolling"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "latency", "rolling"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
    }
  }
}

resource "instana_slo_config" "app_m_r_3" {
  name = "tfslo_app_monthly_r_timebased_availability_rolling"
  target = 0.91
  tags = ["terraform", "app", "timebased", "availability", "rolling"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
    }
  }
}

resource "instana_slo_config" "app_m_r_4" {
  name = "tfslo_app_monthly_r_eventbased_availability_rolling"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "availability", "rolling"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
    }
  }
}

resource "instana_slo_config" "app_m_r_5" {
  name = "tfslo_app_monthly_r_eventbased_custom_rolling"
  target = 0.91
  tags = ["terraform", "app", "eventbased", "custom", "rolling"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
    }
  }
}

resource "instana_slo_config" "app_m_r_6" {
  name = "tfslo_app_monthly_r_traffic_all_rolling"
  target = 0.91
  tags = ["terraform", "app", "traffic", "all", "rolling"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
    }
  }
}

resource "instana_slo_config" "app_m_r_7" {
  name = "tfslo_app_monthly_r_traffic_erroneous_rolling"
  target = 0.91
  tags = ["terraform", "app", "traffic", "erroneous", "rolling"]
  entity {
    application {
      application_id = var.app_id
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
      duration = 4
      duration_unit = "week"
    }
  }
}

