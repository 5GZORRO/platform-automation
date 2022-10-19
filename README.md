# 5GZORRO platform deployment

Installs the [5GZORRO](https://www.5gzorro.eu/) platform with all modules dependencies with 4 provider (admin, regulator, trader, consumer).

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

```console
helm upgrade --install zorro5g helm/platform-5gzorro/ --values terraform/5gzorro-platform-values.yaml
```

## Azure Prerequisites

- Azure-cli 2.41.0+ 
- Terraform 1.2.8+
- Ansible 2.13.3+
  
_Those scripts can be reused with other cloud provider or On-premises with some changes_

## Azure Installation

```console
export TF_VAR_azure_tenant_id="<tenant id of your azure account>"
export TF_VAR_registry="<path of config.json containing docker registry credentials>"
## If your planning to use zeroSSL uncomment this section.
# export TF_VAR_zerossl_hmac="<zeroSSL hmac you can find it on the developer section>"
# export TF_VAR_zerossl_kid="<zeroSSL kid you can find it on the developer section>"
cd terraform/
terraform init
terraform plan
terraform apply
```

_Make sure you are logged in and have the permissions to create the resources in the subscription_

## Configuration

The following table lists the configurable parameters of the 5GZORRO chart and their default values.  See
the documentation of each componet for more details.

### Global parameters

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| tags | object | `{"admin":true,"base":true,"monitoring":true,"regulator":true,"trader":true}` | tags can be used to disable/enable specific profiles (check in the Chart.yaml to see tags -> component mapping) |
| tags.base | bool | `true` | Enable all compontens in basic profile  |
| tags.admin | bool | `true` | Enable all compontens in admin profile |
| tags.trader | bool | `true` | Enable all compontens in trader profile |
| tags.regulator | bool | `true` | Enable all compontens in regulator profile |
| tags.monitoring | bool | `true` | Enable monitoring profile |
| global.imagePullSecrets[0] | object | `{"name":"registry-credentials"}` | Name of the registry credentials secrets manually created |
| global.imageCredentials.registry | string | `""` | URL of the repository where all the images are stored |
| global.imageCredentials.username | string | `""` | Username |
| global.imageCredentials.password | string | `""` | Password |

### Base profile parameters

| ingress-nginx.enabled | bool | `true` | Enable ingress-nginx controller. See [ingress-nginx](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx) documentation for more datails. |
| ingress-nginx.controller | object | `{"service":{"annotations":{"external-dns.alpha.kubernetes.io/hostname":""}}}` | Set it with your domain |
| cert-manager.enabled | bool | `true` | Enable cert-manager operator. See [cert-manager](https://cert-manager.io/docs/installation/helm/) documentation for more datails. |
| cert-manager.namespace | string | `"cert-manager"` | Namespace name where cert-manager will be installed. |
| rabbitmq-cluster-operator.enabled | bool | `true` | Enable rabbitmq operator. See [rabbitmq-cluster-operator](https://github.com/bitnami/charts/tree/main/bitnami/rabbitmq-cluster-operator) documentation for more datails. |
| custom-resource-5gzorro.enabled | bool | `true` | Enable 5GZORRO custom resource like rabbitmq, mongodb and postgresSQL clusters. |
| custom-resource-5gzorro.rabbitmq-cluster-operator.enabled | bool | `true` | Enable custom resource for rabbitmq-cluster |
| custom-resource-5gzorro.rabbitmq-cluster-operator.rabbitmqClusters | list | `[{"name":"rabbitmq-elma-admin","replicas":1},{"name":"rabbitmq-elma-regulator","replicas":1},{"name":"rabbitmq-elma-trader","replicas":1},{"name":"rabbitmq-elma-consumer","replicas":1}]` | RabbitMQ cluster configurations  |
| custom-resource-5gzorro.certmanager.email | string | `""` | email address used for notifications about certificate status |
| custom-resource-5gzorro.certmanager.zerossl.enabled | bool | `false` | Enable zerossl certficate provider account is needed. |
| custom-resource-5gzorro.certmanager.zerossl.eabKid | string | `"${EAB_KID}"` | EABK ID available in zeroSSL developer console  |
| custom-resource-5gzorro.certmanager.zerossl.eabHmac.secretName | string | `"zerossl-eabsecret"` | HMAC secrets name  |
| custom-resource-5gzorro.certmanager.zerossl.eabHmac.secretKey | string | `"secret"` | HMAC secrets name  |
| custom-resource-5gzorro.certmanager.letsencrypt.enabled | bool | `true` | Enable letsencrypt certificate provider |
| custom-resource-5gzorro.certmanager.azureDns | object | `{"clientID":"${MANAGEND_IDENTITY_CLIENT_ID}","hostedZoneName":"${HOSTED_ZONE_NAME}","resourceGroupName":"${RESOURCE_GROUP_NAME}","subscriptionID":"${SUBSCRIPTION_ID}"}` | Azure DNS configurations  |
| custom-resource-5gzorro.kube-prometheus-stack.enabled | bool | `true` | Enable prometues to scrape some custom metrics |
| custom-resource-5gzorro.community-operator.enabled | bool | `true` | Enable MongoDB custom resource |
| custom-resource-5gzorro.community-operator.community-operator-crds.enabled | bool | `false` |  |
| custom-resource-5gzorro.community-operator.mongodbClusters | list |  | MongoDB clusters list |
| custom-resource-5gzorro.community-operator.mongodbClusters[0] | object | `{"name":"mongodb-admin","replicas":1,"users":[{"db":"admin","name":"idp-admin","passwordSecretRef":{"name":"5gzorro-mongodb-idp-admin-password"},"roles":[{"db":"administrator","name":"readWrite"},{"db":"provider","name":"readWrite"}],"scramCredentialsSecretName":"5gzorro-mongodb-idp-admin-scram"},{"db":"admin","name":"xrm-admin","passwordSecretRef":{"name":"5gzorro-mongodb-xrm-admin-password"},"roles":[{"db":"gravitee","name":"readWrite"}],"scramCredentialsSecretName":"5gzorro-mongodb-xrm-admin-scram"},{"db":"admin","name":"srsd","passwordSecretRef":{"name":"5gzorro-mongodb-srsd-admin-password"},"roles":[{"db":"srsd","name":"readWrite"}],"scramCredentialsSecretName":"5gzorro-mongodb-srsd-admin-scram"}],"version":"4.2.6"}` | MongoDB clusters configurations example |
| custom-resource-5gzorro.strimzi.enabled | bool | `true` | Enable kafka custom resource |
| custom-resource-5gzorro.strimzi.kafkaClusters | list |  | kafka clusters list |
| custom-resource-5gzorro.strimzi.kafkaClusters[0] | object | `{"config":{"default.replication.factor":3,"inter.broker.protocol.version":"3.2","min.insync.replicas":1,"offsets.topic.replication.factor":3,"transaction.state.log.min.isr":2,"transaction.state.log.replication.factor":3},"name":"kafka-cluster","replicas":3,"storage":{"type":"jbod","volumes":[{"deleteClaim":false,"id":0,"size":"32Gi","type":"persistent-claim"},{"deleteClaim":false,"id":1,"size":"32Gi","type":"persistent-claim"}]},"version":"3.2.0","zookeeper":{"replicas":3,"storage":{"size":"32Gi","type":"persistent-claim"}}}` | Kafka clusters configurations example |
| custom-resource-5gzorro.strimzi.kafkaTopics | list |  | kafka topic list |
| custom-resource-5gzorro.strimzi.kafkaTopics[0] | object | `{"clusterName":"kafka-cluster","name":"dlt-product-offerings","spec":{"partitions":3,"replicas":1}}` | Kafka topic configurations example |
| custom-resource-5gzorro.postgres-operator.enabled | bool | `true` | Enable PostgresSQL custom resource |
| custom-resource-5gzorro.postgres-operator.postgresqlClusters | list |  | PostgresSQL clusters list |
| custom-resource-5gzorro.postgres-operator.postgresqlClusters[0] | object | `{"name":"zorro5g-psqldb-admin","spec":{"databases":{"governancemanageradmin":"governancemanageradmin","legalproseadmin":"legalproseadmin","mdaadmin":"mdaadmin","nssoadmin":"nssoadmin","rsocadmin":"rsocadmin","sclmadmin":"sclmadmin","xrmcatalogueappadmin":"xrmcatalogueappadmin","xrmtranslatoradmin":"xrmtranslatoradmin"},"numberOfInstances":1,"postgresql":{"version":"14"},"teamId":"zorro5g","users":{"governancemanageradmin":["superuser","createdb"],"legalproseadmin":["superuser","createdb"],"mdaadmin":["superuser","createdb"],"nssoadmin":["superuser","createdb"],"rsocadmin":["superuser","createdb"],"sclmadmin":["superuser","createdb"],"xrmcatalogueappadmin":["superuser","createdb"],"xrmtranslatoradmin":["superuser","createdb"]},"volume":{"size":"256Gi","storageClass":"managed-premium"}}}` | PostgresSQL clusters configurations example |
| external-dns.enabled | bool | `true` | Enable external-dns controller. See [external-dns](https://github.com/kubernetes-sigs/external-dns/tree/master/charts/external-dns) documentation for more datails. |
| external-dns.provider | string | `"azure"` | Select DNS provider |
| external-dns.azure | object | `{"resourceGroup":"${RESOURCE_GROUP_NAME}","subscriptionId":"${SUBSCRIPTION_ID}","tenantId":"${AZURE_TENANT_ID}","useManagedIdentityExtension":true}` | Azure provider configuration |
| external-dns.txtOwnerId | string | `"external-dns"` |  |
| external-dns.domainFilters | list | `["*.${HOSTED_ZONE_NAME} "]` | Set this filter according to your dns configuration |
| kube-prometheus-stack.enabled | bool | `true` | Enable kube-prometheus-stack. See [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) documentation for more datails. |
| loki-stack.enabled | bool | `true` | Enable loki-stack. See [loki-stack](https://github.com/grafana/helm-charts/tree/main/charts/loki-stack) documentation for more datails. |
| minio.enabled | bool | `true` | Enable minio. See [minio](https://github.com/minio/operator/tree/master/helm/operator) documentation for more datails. |
| postgres-operator.enabled | bool | `true` | Enable postgres-operator. See [postgres-operator](https://github.com/zalando/postgres-operator) documentation for more datails. |
| strimzi.enabled | bool | `true` | Enable Kafka Strimzi Operator. See [kafka-strimzi](https://github.com/strimzi/strimzi-kafka-operator) documentation for more datails. |
| strimzi.watchAnyNamespace | bool | `true` | Watch for CR in all namespaces |
| community-operator.enabled | bool | `true` | Enable MongoDB Community Operator. See [mongodb-community](https://github.com/mongodb/mongodb-kubernetes-operator) documentation for more datails. |
| community-operator.community-operator-crds.enabled | bool | `false` | Disable CRD creation that can cause problems with umbrella charts |
| argo-workflows.enabled | bool | `true` | Enable Argo Workflow. See [argo-workflows](https://github.com/argoproj/argo-helm/tree/main/charts/argo-workflows) documentation for more datails. |
| argo-workflows.crds.install | bool | `false` | Disable CRD creation that can cause problems with umbrella charts |
| argo-events.enabled | bool | `true` | Enable Argo Events. See [argo-events](https://github.com/argoproj/argo-helm/tree/main/charts/argo-events) documentation for more datails. |
| argo-events.crds.install | bool | `false` | Disable CRD creation that can cause problems with umbrella charts |                   |