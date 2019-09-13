resource "google_compute_network" "sample_network" {
  name                    = "sample-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "sample_zone" {
  ip_cidr_range            = "172.20.21.0/28"
  name                     = "sample-zone"
  network                  = "${google_compute_network.sample_network.name}"
  region                   = "${var.region}"
  private_ip_google_access = true
  enable_flow_logs         = true
}

# Allow ssh connection from the IAP proxy to bastion instances
resource "google_compute_firewall" "IAP-to-bastion" {
  name    = "iap-to-bastion"
  network = "${google_compute_network.sample_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]

  target_tags = ["bastion"]
}
