# retail-open-data-stack
# DataStax Enterprise & Luna Streaming CDC Demo
## TL;DR
- This demo is intended to illustrate [CDC for Apache Cassandra](https://www.datastax.com/cdc-apache-cassandra) and its ability to publish changes in C* to a backend or downstream system
- End to end, this will deploy a GKE Cluster, DSE Cluster, Pulsar Cluster, Grafana, Elasticsearch, and Kibana
- Data will be automatically loaded into the DSE cluster and sent via Pulsar & CDC to an Elasticsearch index
- This demo takes about 30-40 minutes to deploy on GKE if your local environment is stable
- It's recommended to deploy ahead of time and limit the customer demo to the data load while displaying the various UI elements
- Should the audience be more interested in the deployment of the solution, the repo is public and can be shared
## Prerequsites
- GCP account 
- Permissions to a GCP Project where GKE clusters can be deployed
- gcloud sdk
    - ensure gcloud is at the latest version
    - [Configure Cluster Access for kubectl](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl)
- kubectl
- helm
- awk
- jq
## Setup
- Clone the repo and provide execute permissions to the four shell scripts via something like `chmod +x`
- Ensure your local machine has all the above prerequisites 
- Run the shell scripts in order (00-02) to deploy the environment and load data
- Script 00 takes three arguments to deploy the GKE cluster
  - Your GCP project name (where you have permissions to deploy a GKE cluster)
  - The name you want to give your GKE cluster (like `my-name-dse-cdc-test`)
  - The GCP region in which you want to deploy your cluster (e.g. `us-central1-c`)


