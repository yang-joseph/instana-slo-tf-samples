
resource "instana_application_config" "tf_allServices" {
    label = "allServices-tf-test"
    scope = "INCLUDE_IMMEDIATE_DOWNSTREAM_DATABASE_AND_MESSAGING"
    boundary_scope = "INBOUND"
    tag_filter = "call.type@na NOT_EMPTY"
}

output "allServicesAppId" {
    value = instana_application_config.tf_allServices.id
}

# SLO configurations
resource "instana_slo_config" "terraform_app_1" {
	name = "tf_app_1_test"
	target = 0.91
	tags = ["terraform", "app", "timebased", "latency", "fixed"]
	entity {
	  application {
		application_id = instana_application_config.tf_allServices.id
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
    start_timestamp = "1718198400000"
	  }
	}
  }


  resource "instana_slo_config" "terraform_app_2" {
	name = "tf_app_2_test"
	target = 0.98
	tags = ["terraform", "app", "timebased", "latency", "fixed"]
	entity {
	  application {
		application_id = instana_application_config.tf_allServices.id
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
    start_timestamp = "1718198400000"
	  }
	}
  }

# SLO Correction Configurations
# These configurations are used to define SLO corrections for the specified SLOs.
# One-time (non-recurrent) correction windows
resource "instana_slo_correction_config" "correction_1" {
	name        = "One-Time SLO Correction 1"
	description = "This is a one-time SLO correction config."
	active      = true
	scheduling {
		start_time     = 1718000880000
		duration       = 60
		duration_unit  = "MINUTE"
		recurrent_rule = "" # No recurrence
	}
	slo_ids = [instana_slo_config.terraform_app_1.id, instana_slo_config.terraform_app_2.id]
	tags    = ["one-time", "tag1"]
}

resource "instana_slo_correction_config" "correction_2" {
	name        = "One-Time SLO Correction 2"
	description = "Second one-time SLO correction config."
	active      = false
	scheduling {
		start_time     = 1718100000000
		duration       = 120
		duration_unit  = "MINUTE"
		recurrent_rule = "" # No recurrence
	}
	slo_ids = [instana_slo_config.terraform_app_2.id]
	tags    = ["one-time", "tag2"]
}

# Recurring correction windows with various recurrence parameters

resource "instana_slo_correction_config" "correction_3" {
	name        = "Daily Recurrence"
	description = "Daily recurrence."
	active      = true
	scheduling {
		start_time     = 1718200000000
		duration       = 30
		duration_unit  = "MINUTE"
		recurrent_rule = "FREQ=DAILY;INTERVAL=1"
	}
	slo_ids = [instana_slo_config.terraform_app_1.id]
	tags    = ["daily", "until"]
}

resource "instana_slo_correction_config" "correction_4" {
	name        = "Weekly Recurrence Count"
	description = "Weekly recurrence for 5 occurrences."
	active      = true
	scheduling {
		start_time     = 1718300000000
		duration       = 45
		duration_unit  = "MINUTE"
		recurrent_rule = "FREQ=WEEKLY;INTERVAL=1;COUNT=5"
	}
	slo_ids = [instana_slo_config.terraform_app_1.id, instana_slo_config.terraform_app_2.id]
	tags    = ["weekly", "count"]
}

resource "instana_slo_correction_config" "correction_5" {
	name        = "Hourly Recurrence ByDay"
	description = "Hourly recurrence on Mondays and Wednesdays."
	active      = true
	scheduling {
		start_time     = 1718400000000
		duration       = 15
		duration_unit  = "MINUTE"
		recurrent_rule = "FREQ=HOURLY;INTERVAL=1;BYDAY=MO,WE"
	}
	slo_ids = [instana_slo_config.terraform_app_2.id]
	tags    = ["hourly", "byday"]
}

resource "instana_slo_correction_config" "correction_6" {
	name        = "Yearly Recurrence Until"
	description = "Yearly recurrence until a specific date."
	active      = false
	scheduling {
		start_time     = 1718500000000
		duration       = 180
		duration_unit  = "MINUTE"
		recurrent_rule = "FREQ=YEARLY;INTERVAL=1;UNTIL=20260601T000000Z"
	}
	slo_ids = [instana_slo_config.terraform_app_1.id]
	tags    = ["yearly", "until"]
}

resource "instana_slo_correction_config" "correction_7" {
	name        = "Biweekly Recurrence ByDay"
	description = "Biweekly recurrence on Fridays."
	active      = true
	scheduling {
		start_time     = 1718600000000
		duration       = 60
		duration_unit  = "MINUTE"
		recurrent_rule = "FREQ=WEEKLY;INTERVAL=2;BYDAY=FR"
	}
	slo_ids = [instana_slo_config.terraform_app_1.id, instana_slo_config.terraform_app_2.id]
	tags    = ["biweekly", "byday"]
}

resource "instana_slo_correction_config" "correction_8" {
	name        = "Monthly Recurrence Count ByDay"
	description = "Monthly recurrence for 3 occurrences on the first Monday."
	active      = false
	scheduling {
		start_time     = 1718700000000
		duration       = 90
		duration_unit  = "MINUTE"
		recurrent_rule = "FREQ=MONTHLY;INTERVAL=1;COUNT=3;BYDAY=1MO"
	}
	slo_ids = [instana_slo_config.terraform_app_2.id]
	tags    = ["monthly", "count", "byday"]
}
