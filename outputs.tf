output "kubeconfig_gcloud_cmd" {
    value = "gcloud container clusters get-credentials ${var.cluster_name} --region ${var.location} --project ${var.project_name}"
}

# gcloud container clusters get-credentials k8s-demo --region us-east1 --project gke-basic-cluster