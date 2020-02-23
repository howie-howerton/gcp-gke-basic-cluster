variable "key_file" {
  description = "Path to Service Account key file."
}
variable "project_name" {
  description = "Google Project name that will contain all resources."
  default     = "gke-basic-cluster"
}

variable "location" {
  description = "The preferred Region in which to launch the resources outlined in this template. If you specify a zone (such as us-central1-a), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as us-west1), the cluster will be a regional cluster with multiple masters spread across zones in the region, and with default node locations in those zones as well."
  default     = "us-east1"
}
variable "cluster_name" {
  description = "Cluster name for the EKS cluster"
  default     = "k8s-demo"
}
variable "node_count" {
  description = "Number of worker nodes for the cluster."
  default     = "1"
}
variable "machine_type" {
  description = "The machine type (VM size) to use for each of the worker nodes."
  default     = "n1-standard-1"
}
