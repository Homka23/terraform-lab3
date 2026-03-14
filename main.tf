locals {
  common_tags = {
    project = "terraform-lab3"
    owner   = "anna khomutnyk"
    variant = "10"
  }
}

resource "google_compute_network" "vpc_lab3" {
  name                    = "vpc-lab3-10"
  auto_create_subnetworks = false
  description             = "VPC for Terraform Lab 3"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet_a" {
  name          = "subnet-a"
  ip_cidr_range = var.subnet_a_cidr
  region        = "us-central1"
  network       = google_compute_network.vpc_lab3.id
}

resource "google_compute_subnetwork" "subnet_b" {
  name          = "subnet-b"
  ip_cidr_range = var.subnet_b_cidr
  region        = "us-central1"
  network       = google_compute_network.vpc_lab3.id
}

resource "google_compute_firewall" "web_allow" {
  name    = "web-allow"
  network = google_compute_network.vpc_lab3.id

  allow {
    protocol = "tcp"
    ports    = [var.web_port]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

resource "google_compute_instance" "web_vm" {
  name         = "web-vm-10"
  machine_type = "e2-micro"          
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts" 
    }
  }

  network_interface {
    network    = google_compute_network.vpc_lab3.id
    subnetwork = google_compute_subnetwork.subnet_a.id
    access_config {} # Public IP
  }

  metadata_startup_script = file("bootstrap.sh") 

  tags = ["web-server"]
}