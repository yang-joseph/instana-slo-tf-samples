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

# SLO - 1
resource "instana_slo_config" "slo4Alert_1" {
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

# SLO - 2
resource "instana_slo_config" "slo4Alert_2" {
  name = "tfslo_app_traffic_erroneous_fixed"
  target = 0.91
  tags = ["terraform", "app", "traffic", "erroneous", "fixed"]
  entity {
    application {
      application_id = instana_application_config.myAllServices.id
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
      start_timestamp = var.fixed_timewindow_start_timestamp
    }
  }
}


# Alerts
# status_alert
resource "instana_slo_alert_config" "status_alert" {
  name         = "terraform_status_alert"
  description  = "terraform_status_alert testing"
  severity     = 5
  triggering   = true
  alert_type   = "status"

  threshold {
    type = "staticThreshold"
    operator = ">"
    value    = 0.3
  }

  slo_ids           = [instana_slo_config.slo4Alert_1.id, instana_slo_config.slo4Alert_2.id]
  alert_channel_ids = ["orhurugksjfgh"]

  time_threshold {
    time_window = 60000
    expiry      = 60000
  }

	custom_payload_field {
		key    = "test1"
		value  = "foo"
	}

  enabled  = true
}

output "terraform_status_alert" {
  value = instana_slo_alert_config.status_alert.id
}

# error_budget_alert
resource "instana_slo_alert_config" "error_budget_alert" {

   name = "terraform_error_budget_alert"
   description = "Consumed >= 3% of the error budget."
   severity = 10
   triggering = true
   alert_type = "error_budget"

  threshold {
    type = "staticThreshold"
    operator = ">"
    value    = 0.3
  }

  slo_ids           = [instana_slo_config.slo4Alert_1.id, instana_slo_config.slo4Alert_2.id]
  alert_channel_ids = ["orhurugksjfgh"]

  time_threshold {
    time_window = 60000
    expiry      = 60000
  }

	custom_payload_field {
		key    = "test"
		value  = "foo"
	}

  enabled  = true
}

output "terraform_error_budget_alert" {
  value = instana_slo_alert_config.error_budget_alert.id
}

# burn_rate_alert
resource "instana_slo_alert_config" "burn_rate_alert" {
  name        = "terraform_burn_rate_alert"
  description = "Consumed >= 3% of of the error budget."
  severity    = 10
  triggering  = true   

  alert_type  = "burn_rate"

  burn_rate_time_windows {
    long_time_window {
      duration     = 2
      duration_type = "day"
    }

    short_time_window {
      duration     = 30
      duration_type = "minute"
    }
  }

  threshold {
    type     = "staticThreshold"
    operator = ">"
    value    = 1
  }

  slo_ids           = [instana_slo_config.slo4Alert_1.id, instana_slo_config.slo4Alert_2.id]
  alert_channel_ids = ["orhurggugksjfgh"]

  time_threshold {
    time_window = 60000
    expiry      = 60000
  }

  custom_payload_field {
    key    = "test"
    value  = "foo"
  }

  enabled = true
}


output "terraform_burn_rate_alert" {
  value = instana_slo_alert_config.burn_rate_alert.id
}