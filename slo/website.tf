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
  }
   time_window {
     fixed {
       duration = 1
       duration_unit = "day"
       start_timestamp = var.fixed_timewindow_start_timestamp
     }
   }
}

resource "instana_slo_config" "website_2" {
  name = "tfslo_website_eventbased_latency_fixed"
  target = 0.91
  tags = ["terraform", "web", "eventbased", "latency", "fixed"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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
       start_timestamp = var.fixed_timewindow_start_timestamp
     }
   }
}

resource "instana_slo_config" "website_3" {
  name = "tfslo_website_timebased_availability_fixed"
  target = 0.91
  tags = ["terraform", "web", "timebased", "availability", "fixed"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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
       start_timestamp = var.fixed_timewindow_start_timestamp
     }
   }
}


resource "instana_slo_config" "website_4" {
  name = "tfslo_website_eventbased_availability_fixed"
  target = 0.91
  tags = ["terraform", "web", "eventbased", "availability", "fixed"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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
       start_timestamp = var.fixed_timewindow_start_timestamp
     }
   }
}

resource "instana_slo_config" "website_5" {
  name = "tfslo_website_eventbased_custom_fixed"
  target = 0.91
  tags = ["terraform", "web", "eventbased", "custom", "fixed"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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
       start_timestamp = var.fixed_timewindow_start_timestamp
     }
   }
}

resource "instana_slo_config" "website_6" {
  name = "tfslo_website_traffic_all_fixed"
  target = 0.91
  tags = ["terraform", "web", "traffic", "all", "fixed"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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
       start_timestamp = var.fixed_timewindow_start_timestamp
     }
   }
}

resource "instana_slo_config" "website_7" {
  name = "tfslo_website_traffic_erroneous_fixed"
  target = 0.91
  tags = ["terraform", "web", "traffic", "erroneous", "fixed"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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
       start_timestamp = var.fixed_timewindow_start_timestamp
     }
   }
}


resource "instana_slo_config"  "website_r_1" {
  name = "tfslo_website_timebased_latency_rolling"
  target = 0.91
  tags = ["terraform", "web", "timebased", "latency", "rolling"]
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
  }
   time_window {
     rolling {
       duration = 1
       duration_unit = "day"
     }
   }
}

resource "instana_slo_config"  "website_r_2" {
  name = "tfslo_website_eventbased_latency_rolling"
  target = 0.91
  tags = ["terraform", "web", "eventbased", "latency", "rolling"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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

resource "instana_slo_config"  "website_r_3" {
  name = "tfslo_website_timebased_availability_rolling"
  target = 0.91
  tags = ["terraform", "web", "timebased", "availability", "rolling"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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


resource "instana_slo_config"  "website_r_4" {
  name = "tfslo_website_eventbased_availability_rolling"
  target = 0.91
  tags = ["terraform", "web", "eventbased", "availability", "rolling"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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

resource "instana_slo_config"  "website_r_5" {
  name = "tfslo_website_eventbased_custom_rolling"
  target = 0.91
  tags = ["terraform", "web", "eventbased", "custom", "rolling"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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

resource "instana_slo_config"  "website_r_6" {
  name = "tfslo_website_traffic_all_rolling"
  target = 0.91
  tags = ["terraform", "web", "traffic", "all", "rolling"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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

resource "instana_slo_config"  "website_r_7" {
  name = "tfslo_website_traffic_erroneous_rolling"
  target = 0.91
  tags = ["terraform", "web", "traffic", "erroneous", "rolling"]
  entity {
    website {
     website_id = instana_website_monitoring_config.myweb1.id
     beacon_type = "httpRequest"
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


output "sloConfigId_web_1" {
  value = instana_slo_config.website_1
}
output "sloConfigId_web_2" {
  value = instana_slo_config.website_2
}
output "sloConfigId_web_3" {
  value = instana_slo_config.website_3
}
output "sloConfigId_web_4" {
  value = instana_slo_config.website_4
}
output "sloConfigId_web_5" {
  value = instana_slo_config.website_5
}
output "sloConfigId_web_6" {
  value = instana_slo_config.website_6
}
output "sloConfigId_web_7" {
  value = instana_slo_config.website_7
}

