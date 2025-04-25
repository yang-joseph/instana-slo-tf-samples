variable "project_name" {
  type        = string
  description = "Instana SLO dev"
  default = "terraform-init"
}

variable "app_id" {
  type        = string
  default = "9Ww65Q00RKajVnqIq1hvug"
}

variable "app_threshold_latency" {
  type        = number
  default = 36
}

variable "app_threshold_error_rate" {
  type        = number
  default = 0.07
}

variable "app_threshold_all_traffic" {
  type        = number
  default = 20000
}

variable "app_threshold_erroneous_traffic" {
  type        = number
  default = 800
}


variable "website_id" {
  type        = string
  default = "QsaUQHr-Q_6jQqQlMxpdrA"
}

variable "synthetic_test_ids" {
  type = list(string)
  default = ["DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U" ]
}

variable "fixed_timewindow_start_timestamp" {
  type = number
  default = 1698552000000
}