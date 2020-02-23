# gcp-gke-basic-cluster
A terraform template to create a basic GKE cluster on Google Cloud Platform

## Detailed Description

This terraform template is designed to facilitate the creation of a 'vanilla' GCP EKS cluster for usage with testing/demos/etc.
It will create:
- A new EKS cluster within an *existing* GCP Project

The output from running the template will contain the gcloud command to set the local Kubernetes config that you'll need in order to use the kubectl command line utility.  That command will look something like this:
```
gcloud container clusters get-credentials k8s-demo --region us-east1 --project gke-basic-cluster
```

# Local MBP/Linux workstation Pre-Requisites
- git
- terraform
- google-cloud-sdk
- kubectl
- helm

The Google Cloud SDK can be installed via homebrew like so:
```
brew cask install google-cloud-sdk
```
Initialize the SDK (if you haven't already)
```
gcloud init
```
Follow the prompts to login, choose a cloud project and set the default compute region/zone (ie: us-east1-b)

# GCP Pre-Requisites
- A Google Cloud Platform account
- A pre-created Project into which we will launch the GKE cluster
- A Service Account Key for the above Project (in JSON format)
- Kubernetes API (Enabled)


# Usage
1. Clone this repository
```
git clone https://github.com/howie-howerton/gcp-gke-basic-cluster.git
```
2. Edit the variables in the sample 'terraform.tfvars.changeme' file to suit your GCP environment

3. Remove the '.changeme' extension from terraform.tfvars.changeme so that the filename reads as: terraform.tfvars

4. Initialize terraform
```
terraform init
```
5. Run 'terraform apply' to execute the template
```
terraform apply
```
   This process typically takes 10-15 minutes.
6. Use the output for the 'kubeconfig_gcloud_cmd' variable to set the KUBECONFIG environment variable.  It will look similar to this:
```
gcloud container clusters get-credentials k8s-demo --region us-east1 --project gke-basic-cluster
```
7. You should now be able to manage your cluster with the kubectl cli utility:
```
kubectl cluster-info
```
```
kubectl get nodes
```

# Cleaning up
After you've finished with your cluster, you can destroy/delete it (to keep your Azure bill as low as possible)
```
terraform destroy -auto-approve
```
   This process typically takes 10-15 minutes.
