# 5GZORRO platform deployment

Installs the [5GZORRO](https://www.5gzorro.eu/) platform with all modules dependencies with 4 provider (admin, regulator, trader, consumer).

![Alt text](/azure-infrastructure-diagram.png?raw=true "Azure Infrastructure Diagram")

## Prerequisites

- Kubernetes >=1.20 <1.22
- Helm 3+

## Dependencies

By default this chart require additional components:

- [VON-Network](https://github.com/5GZORRO/identity#build-von-network)
- [Corda-Network](https://github.com/5GZORRO/smart-contract-lifecycle-manager#running-corda-nodes-locally)
- [OSM](https://github.com/5GZORRO/smart-contract-lifecycle-manager#running-corda-nodes-locally)

_See [Azure Prerequisites](#Azure-Prerequisites) for automated installation of those components._

## Install Helm Chart

Copy one of the template present in values-template folder and modify the values according to your needs.

```console
helm upgrade --install zorro5g helm/platform-5gzorro/ --values values.yaml
```

## Custom Installation 

Default 5GZORRO installation includes 4 operators, respectively with the roles of admin, regulator, trader and consumer.
However, it is possible to customize the installation by adding or removing operators with their roles.
To do this, simply clone the portion of code between `START ...... Profile Block` and `END ...... Profile Block` in both files Chart.yaml and 5gzorro-platform-values.yaml.tftpl and change all to properties according to your custom operator configurations.

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
## If you're planning to use zeroSSL uncomment this section.
# export TF_VAR_zerossl_hmac="<zeroSSL hmac you can find it on the developer section>"
# export TF_VAR_zerossl_kid="<zeroSSL kid you can find it on the developer section>"
cd terraform/
terraform init
terraform plan
terraform apply
```

_Make sure you are logged in and have the permissions to create the resources in the subscription_

## Configuration

All the configurable parameters of the 5GZORRO chart and their default values, can be found at this link [README](/helm/platform-5gzorro/README.md "Azure Infrastructure Diagram").  See
the documentation of each componet for more details.
