# 5GZORRO platform deployment

In this project we provide an automated way to install [5GZORRO](https://www.5gzorro.eu/) platform. We create different template that satisfy different scenario. Whit the default scenario a complete version of 5GZORRO will be deployed, with all modules dependencies (exluded VON-Network, Corda Network, OSM) and 4 operators that have different role (admin, regulator, trader, consumer).

In the repository are also present some scripts that allow users to automate the deployment of the additional components that are required by the 5GZORRO platform like VON-Network, Corda-Network in the Azure Cloud Enviroment. See [Azure](#Azure) for more details.

![Alt text](/azure-infrastructure-diagram.png?raw=true "Azure Infrastructure Diagram")

## Prerequisites

If you want to deploy 5GZORRO platform on bare-metal or in a cloud provider different from Azure, there're three main prerequisite, a Kubernetes cluster with an IP address that is reaceble from the clients, a domain name that point to this IP and a client with kubectl and helm installed to run the installation commands.

- Kubernetes >=1.20 <1.22
- Helm 3+
- Domain Name 

## Dependencies

This chart require additional components, those components needs to be installed separetely:

- [VON-Network](https://github.com/5GZORRO/identity#build-von-network)
- [Corda-Network](https://github.com/5GZORRO/smart-contract-lifecycle-manager#running-corda-nodes-locally)
- [OSM](https://github.com/5GZORRO/smart-contract-lifecycle-manager#running-corda-nodes-locally)

_See [Azure](#Azure) for automated installation of those components._

## Install Helm Chart

Copy one of the template present in values-templates folder and modify the values according to your needs, make sure you have changed the variables ${...} present in the template.

```console
helm upgrade --install zorro5g helm/platform-5gzorro/ --values <custom-values-file>.yaml
```

## Configuration

All the configurable parameters of the 5GZORRO chart and their default values, can be found at this link [README](/helm/platform-5gzorro/README.md "Helm Values").  See the documentation of each componet for more details.

## Custom Installation 

Default 5GZORRO installation includes 4 operators, respectively with the roles of admin, regulator, trader and consumer.
However, it is possible to customize the installation by adding or removing operators with their roles.
To do this, simply clone the portion of code between `START ...... Profile Block` and `END ...... Profile Block` in both files Chart.yaml and 5gzorro-platform-values.yaml.tftpl and change all to properties according to your custom operator configurations.

## Azure

In this repository we provide a way to install 5GZORRO platform with all the componets in a dedicated cloud enviroment (Azure). With this installation method all the components of the 5GZORRO platform inclued the external one (VON-Network, Corda Network, OSM) will be installed in a fully automated way without manual operations. 

## Azure Prerequisites

- Azure-cli 2.41.0+ 
- Terraform 1.2.8+
- Ansible 2.13.3+
- Registered Domain Name 

_Those scripts can be reused with other cloud provider or On-premises with some changes_

## Azure Installation

Before proceeding with the installation create a DNS zone for your domain and delegate it to Azure DNS.

Use the following nameservers:

```console
ns1-02.azure-dns.com.
ns2-02.azure-dns.net.
ns3-02.azure-dns.org.
ns4-02.azure-dns.info.
```
Custumize terraform/terraform.tfvar file according to your needs. 
Pay attention to these values: *subscription_id*, *ssh_public_key*, *domain_name*.

```console
export TF_VAR_azure_tenant_id="<tenant id of your azure account>"
export TF_VAR_registry="<path of config.json containing docker registry credentials>"
export TF_VAR_registry_url="<registry URL>"
export TF_VAR_registry_username="<registry username>"
export TF_VAR_registry_password="<registry access token or password>"
## If you're planning to use zeroSSL uncomment this section.
# export TF_VAR_zerossl_hmac="<zeroSSL hmac you can find it on the developer section>"
# export TF_VAR_zerossl_kid="<zeroSSL kid you can find it on the developer section>"
export TF_VAR_registry="<docker registry config in json format>"
export TF_VAR_bevel_git_url="<fork of bevel repository where all the manifest will be published for gitops>"
export TF_VAR_bevel_repo_email="<git user email>"
export TF_VAR_bevel_repo_password="<git user password/token>"
export TF_VAR_bevel_repo_url="<fork of bevel repository where all the manifest will be published for gitops>"
export TF_VAR_bevel_repo_username="<git username>"
export TF_VAR_bevel_url_suffix="<bevel external URL>"
cd terraform/
terraform init
terraform plan
terraform apply
```

_Make sure you are logged in and have the permissions to create the resources in the subscription_

## Migrate images to private registry

If you need to migrate all the images to your private registry you can use *migrate-docker-images.sh script.

Make sure you are logged into both registries.
```console
docker login <repository URL>
```

Command:
```console
bash migrate-docker-images.sh -o <githup project registry URL> -i <image name> -t <image tag> -n <your private registry url>
```

Example:
```console
bash migrate-docker-images.sh -o ghcr.io/5gzorro/platform-automation -i resource-and-service-offer-catalog -t latest -n ghcr.io/5gzorro/platform-automation
```