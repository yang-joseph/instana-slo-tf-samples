# provider "instana" {
#   api_token = "artqkoXmTAyvnoXOXtz8gQ"  
#   endpoint = "local-instana.pink.instana.rocks:4000"
#   tls_skip_verify = true
# }


resource "instana_slo_config" "synthetic_1" {
   name = "tfslo_synthetic_timebased_latency_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "time-based", "latency", "fixed-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = [ "DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U"]
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

resource "instana_slo_config" "synthetic_2" {
   name = "tfslo_synthetic_eventbased_latency_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "event-based", "latency", "fixed-time-window"]
   entity {
      synthetic {
        synthetic_test_ids = [ "DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U"]
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

resource "instana_slo_config" "synthetic_3" {
   name = "tfslo_synthetic_timebased_availability_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "time-based", "availability", "fixed-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = [ "DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U"]
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

resource "instana_slo_config" "synthetic_4" {
   name = "tfslo_synthetic_eventbased_availability_fixed"
   target = 0.91
   tags = ["terraform", "synthetic", "event-based", "availability", "fixed-time-window"]
   entity {

      synthetic {
        synthetic_test_ids = [ "DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U"]
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

resource "instana_slo_config" "synthetic_5" {
  name = "tfslo_synthetic_custom_fixed"
  target = 0.91
  tags = ["terraform", "synthetic", "custom", "fixed-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = [ "DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U"]
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

resource "instana_slo_config" "synthetic_6" {
  name = "tfslo_synthetic_traffic_all_fixed"
  target = 0.91
  tags = ["terraform", "synthetic", "traffic", "all", "fixed-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = [ "DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U"]
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

resource "instana_slo_config" "synthetic_7" {
  name = "tfslo_synthetic_traffic_erroneous_fixed"
  target = 0.91
  tags = ["terraform", "synthetic", "traffic", "all", "fixed-time-window"]
  entity {
     synthetic {
       synthetic_test_ids = [ "DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U"]
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

output "sloConfigIds_sync_1" {
  value = instana_slo_config.synthetic_1.id
}

output "sloConfigIds_sync_2" {
  value = instana_slo_config.synthetic_2.id
}
output "sloConfigIds_sync_3" {
  value = instana_slo_config.synthetic_3.id
}
output "sloConfigIds_sync_4" {
  value = instana_slo_config.synthetic_4.id
}
output "sloConfigIds_sync_5" {
  value = instana_slo_config.synthetic_5.id
}
output "sloConfigIds_sync_6" {
  value = instana_slo_config.synthetic_6.id
}
output "sloConfigIds_sync_7" {
  value = instana_slo_config.synthetic_7.id
}
