variable "project_name" {
  type        = string
  description = "Instana SLO dev"
  default = "terraform-init"
}

variable "app" {
  type        = string
  default = "all_services"
}

variable "synthetic_tests" {
  type = list(string)
  default = ["DrMyeGl08w79aHHQ3mhH", "sYDtb2slIIfXhPBnodSz", "dNnH73MIOIkrlHc1Mo0U" ]
}

variable "fixed_timewindow_start_timestamp" {
  type = number
  default = 1698552000000
}