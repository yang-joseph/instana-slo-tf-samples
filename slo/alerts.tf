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
## Status
resource "instana_slo_alert_config" "slo_status_alert" {
   name = "terraform_slo_status_alert"
   description = "SLO status below 3%."
   severity = 10
   triggering = true
   alert_type = "status"
    threshold {
      operator = ">="
      value = 0.03
    }
    slo_ids = [
      instana_slo_config.slo_app1.id,
      instana_slo_config.slo_app2.id,
      “1234132“
    ]

    alert_channel_ids = [
      "12345678"
    ]
    time_threshold {
      expiry = 60000
      time_window = 60000
    }
    custom_payload_fields = [
      {
        key = "calls"
        value = "erroneous"
      }
]
    enabled = true
    }

## Error Budget
resource "instana_slo_alert_config" "error_budget_alert" {
   name = "terraform_error_budget_alert"
   description = "Consumed >= 3% of the error budget."
   severity = 10
   triggering = true
   alert_type = "error_budget"
    threshold {
      operator = ">="
      value = 0.5
    }
    slo_ids = [
      instana_slo_config.slo_app1.id,
      instana_slo_config.slo_app2.id,
      “1234132“
    ]
    alert_channel_ids = [
      "123456789"
    ]
    time_threshold {
      expiry = 60000
      time_window = 60000
    }
    custom_payload_fields = [
      {
        key = "calls"
        value = "erroneous"
      }
]
    enabled = true
    }

## Burn Rate
resource "instana_slo_alert_config" "burn_rate_alert" {
   name = "terraform_burn_rate_alert"
   description = "Burn rate"
   severity = 10
   triggering = true
   alert_type = "burn_rate"
   burn_rate_time_windows  {
      long_time_window {
        duration = 10
        duration_type = "hour"
      }
      short_time_window {
        duration = 30
        duration_type = "minute"
      }
   }
    threshold {
      operator = ">="
      value = 1
    }
    slo_ids = [
      instana_slo_config.slo_app1.id,
      instana_slo_config.slo_app2.id,
      “1234132“
    ]
    alert_channel_ids = [
      "123456789"
    ]
    time_threshold {
      expiry = 60000
      time_window = 60000
    }
    custom_payload_fields = [
      {
        key = "calls"
        value = "erroneous"
      }
]
    enabled = true
    }