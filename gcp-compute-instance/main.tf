terraform {
  required_version = ">= 0.12.0"
}

variable "gcp_project" {
  description = "GCP project name"
}

variable "gcp_region" {
  description = "GCP region, e.g. us-east1"
  default     = "us-east1"
}

variable "gcp_zone" {
  description = "GCP zone, e.g. us-east1-a"
  default     = "us-east1-b"
}

variable "machine_type_1" {
  description = "GCP machine type"
  default     = "n1-standard-1"
}

variable "machine_type_2" {
  description = "GCP machine type"
  default     = "n1-standard-2"
}

variable "instance_name_1" {
  description = "GCP instance name"
  default     = "demo-1"
}

variable "instance_name_2" {
  description = "GCP instance name"
  default     = "demo-2"
}

variable "image" {
  description = "image to build instance from"
  default     = "debian-cloud/debian-9"
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

resource "google_compute_instance" "demo_1" {
  name         = var.instance_name_1
  machine_type = var.machine_type_1
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["compute-ro", "monitoring", "service-control"]
  }

  allow_stopping_for_update = true
}

resource "google_compute_instance" "demo_2" {
  name         = var.instance_name_2
  machine_type = var.machine_type_2
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["compute-ro", "monitoring", "service-control"]
  }

  allow_stopping_for_update = true
}

output "external_ip_1" {
  value = google_compute_instance.demo_1.network_interface[0].access_config[0].nat_ip
}

output "external_ip_2" {
  value = google_compute_instance.demo_2.network_interface[0].access_config[0].nat_ip
}
