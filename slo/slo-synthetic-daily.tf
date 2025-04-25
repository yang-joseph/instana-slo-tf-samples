# synthetics
resource "instana_slo_config" "synthetic_1" {
   name = "tfslo_synthetic_timebased_latency_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "time-based", "latency", "fixed-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_2" {
   name = "tfslo_synthetic_eventbased_latency_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "event-based", "latency", "fixed-time-window"]
   entity {
      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_3" {
   name = "tfslo_synthetic_timebased_availability_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "time-based", "availability", "fixed-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_4" {
   name = "tfslo_synthetic_eventbased_availability_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "event-based", "availability", "fixed-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_5" {
  name = "tfslo_synthetic_custom_fixed"
  target = 0.91
  tags = ["terraform", "synthetic", "custom", "fixed-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_6" {
  name = "tfslo_synthetic_traffic_all_fixed"
  target = 0.91
  tags = ["terraform", "synthetic", "traffic", "all", "fixed-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_7" {
  name = "tfslo_synthetic_traffic_erroneous_fixed"
  target = 0.91
  tags = ["terraform", "synthetic", "traffic", "all", "fixed-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_r_1" {
   name = "tfslo_synthetic_timebased_latency_rolling"
   target = 0.91
   tags = ["terraform", "synthetic", "time-based", "latency", "rolling-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_r_2" {
   name = "tfslo_synthetic_eventbased_latency_rolling"
   target = 0.91
   tags = ["terraform", "synthetic", "event-based", "latency", "rolling-time-window"]
   entity {
      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_r_3" {
   name = "tfslo_synthetic_timebased_availability_rolling"
   target = 0.91
   tags = ["terraform", "synthetic", "time-based", "availability", "rolling-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_r_4" {
   name = "tfslo_synthetic_eventbased_availability_rolling"
   target = 0.91
   tags = ["terraform", "synthetic", "event-based", "availability", "rolling-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_r_5" {
  name = "tfslo_synthetic_custom_rolling"
  target = 0.91
  tags = ["terraform", "synthetic", "custom", "rolling-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_r_6" {
  name = "tfslo_synthetic_traffic_all_rolling"
  target = 0.91
  tags = ["terraform", "synthetic", "traffic", "all", "rolling-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = var.synthetic_test_ids
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

resource "instana_slo_config" "synthetic_r_7" {
  name = "tfslo_synthetic_traffic_erroneous_rolling"
  target = 0.91
  tags = ["terraform", "synthetic", "traffic", "all", "rolling-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = var.synthetic_test_ids
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

