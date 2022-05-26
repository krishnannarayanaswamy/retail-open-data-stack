#!/bin/bash
PROJECT_NAME=$1
K8S_CLUSTER_NAME=$2
ENV=$3
REGION=$4
TF_VAR_environment=$3
TF_VAR_name=$2
TF_VAR_project_id=$1
TF_VAR_region=$4

start_deploy() {
  echo "### Beginning k8ssandra Deployment"
  set -x
  set -o pipefail
  trap error ERR
}

error() {
  echo "Error in deploying Stack"
  exit 1
}

clone_repo(){
  #mkdir ~/github
  #cd github
  git clone git@github.com:k8ssandra/k8ssandra-terraform.git
}

add_env(){
TF_VAR_environment=$ENV
TF_VAR_name=$K8S_CLUSTER_NAME
TF_VAR_project_id=$PROJECT_NAME
TF_VAR_region=$REGION
}

deploy_environment(){
cd k8ssandra-terraform/gcp/env
terraform init
terraform plan
terraform apply
}

deploy_k8ssandra(){
    helm repo add k8ssandra https://helm.k8ssandra.io
    helm repo update
    helm install retail-ods-k8ssandra k8ssandra/k8ssandra
}

add_helm_repos(){
  helm repo add datastax https://datastax.github.io/charts
  helm repo add datastax-pulsar https://datastax.github.io/pulsar-helm-chart
  helm repo add elastic https://helm.elastic.co
  helm repo update
}

start_deploy
sleep 1
deploy_k8ssandra
sleep 300
exit 0