# Reference:
# - https://medium.com/@timhberry/learn-terraform-by-deploying-a-google-kubernetes-engine-cluster-a29071d9a6c2
# - https://www.terraform.io/docs/providers/google/r/container_cluster.html

# NOTE: THIS TEMPLATE ASSUMES THAT YOU HAVE ALREADY CREATED A GCP PROJECT, CREATED A SERVICE ACCOUNT WITHIN THE SCOPE 
# OF THAT PROJECT AND EXPORTED THE KEY (IN JSON FORMAT).
# ALSO, YOU WILL NEED TO HAVE ENABLED THE KUBERNETES API.

provider "google" {
  credentials = var.key_file
  project     = var.project_name
  region      = var.location
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

