terraform {
  required_version = ">= 1.14"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "lab1-487614" 
  region  = "us-central1" 
  zone    = "us-central1-a"
}
