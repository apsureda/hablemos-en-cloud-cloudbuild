/*
 * Copyright 2019 Google LLC. This software is provided as-is, without warranty
 * or representation for any use or purpose. Your use of it is subject to your 
 * agreement with Google.  
 */
resource "google_compute_instance" "bastion" {
  name         = "bastion-host"
  machine_type = "n1-standard-1"
  zone         = "${local.vm_zone}"

  tags = ["bastion"]

  labels = {
    entorno = "produccion"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.sample_zone.self_link}"
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}

data "google_compute_zones" "zones" {
  region = "${var.region}"
}

locals {
  # use the zone specified in params if specified. Otherwise, use the first zone in the region.
  vm_zone = "${data.google_compute_zones.zones.names[0]}"
}
