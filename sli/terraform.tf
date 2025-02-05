terraform {
  required_version = "~> 1.6"
  required_providers {
    instana = {
      source  = "instana/instana"
      version = "3.0.0"
    }
  }
}