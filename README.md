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

| Key | Type | Default | Description |
|-----|------|---------|-------------|
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

### Admin profile parameters

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| elma-admin.enabled | bool | `true` | Enable 5GZORRO e-License Manager |
| elma-admin.image.tag | string | `"latest"` | Docker image tag |
| elma-admin.image.app | string | `"elma"` |  |
| elma-admin.image.image | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro/elma"` | Docker image repository |
| elma-admin.image.pullPolicy | string | `"Always"` | Image pull policy |
| elma-admin.role | string | `"admin"` | Define component role/profile |
| elma-admin.domainId | string | `"admin"` | e-License Manager domainID |
| elma-admin.catalog.url | string | `"zorro5g-resource-and-service-offer-catalog-admin"` | URL of the Resource and Service Offer Catalog instance specific for this profile |
| elma-admin.catalog.port | string | `"8080"` | Port of the Resource and Service Offer Catalog instance specific for this profile |
| elma-admin.catalog.resources | string | `"None"` |  |
| elma-admin.netSlice.url | string | `"172.28.3.15"` | Slice Manager API URL |
| elma-admin.netSlice.port | string | `"31082"` | Slice Manager API Port |
| elma-admin.netSlice.endpoint | string | `"portal/elicensing/"` | Slice Manager API endpoint |
| elma-admin.datalake.url | string | `"http://zorro5g-datalake:8080/datalake/v1/catalog/instance/{instance_id}"` | Datalake URL |
| elma-admin.datalake.auth | string | `"{\"userInfo\": {\"userId\": \"operator-a\", \"authToken\": \"blah\"}}"` | Datalake Auth |
| elma-admin.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` | Kafka URL |
| elma-admin.rabbitmq.url | string | `"rabbitmq-elma-admin"` | URL of the RabbitMQ instance specific for this profile |
| elma-admin.rabbitmq.existingSecret | string | `"rabbitmq-elma-admin-default-user"` | RabbitMQ secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| elma-admin.rabbitmq.userKey | string | `"username"` | RabbitMQ secret username key |
| elma-admin.rabbitmq.passwordKey | string | `"password"` | RabbitMQ secret password key |
| aries-cloudagent-admin.enable | bool | `true` | Enable Aries Cloud Agent  |
| aries-cloudagent-admin.image.repository | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro/aries-cloudagent"` | Docker image repository |
| aries-cloudagent-admin.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| aries-cloudagent-admin.image.tag | string | `"0.6.0"` | Docker image tag Overrides the image tag whose default is the chart appVersion. |
| aries-cloudagent-admin.agent.role | string | `"admin"` | Define component role/profile |
| aries-cloudagent-admin.agent.label | string | `"AgentAdmin"` | Define agent label  |
| aries-cloudagent-admin.agent.seed | string | `"AgentAdmin0000000000000000000000"` | Define agent seed |
| aries-cloudagent-admin.agent.did | string | `"RGQ8DpoASL9rZZp69i7wJ8"` | Define agent did |
| aries-cloudagent-admin.agent.walletName | string | `"AgentAdmin"` | Define agent wallet name  |
| aries-cloudagent-admin.agent.walletKey | string | `"AgentAdminKey"` | Define agent wallet key |
| aries-cloudagent-admin.vonUrl | string | `"http://10.241.0.10:9000"` | VON network API URL  |
| aries-cloudagent-admin.persistence.enabled | bool | `true` |  |
| aries-cloudagent-admin.persistence.storageClassName | string | `"default"` |  |
| aries-cloudagent-admin.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| aries-cloudagent-admin.persistence.size | string | `"10Gi"` |  |
| identity-and-permissions-manager-admin.enabled | bool | `true` | Enable 5GZORRO Identity and Permissions Manger |
| identity-and-permissions-manager-admin.database.connectionString | string | `"mongodb-admin-admin-idp-admin"` | MongoDB secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials using connection string format) |
| identity-and-permissions-manager-admin.database.port | string | `"27017"` | MongoDB port |
| identity-and-permissions-manager-admin.ingress.enabled | bool | `true` | Expose the service outside the cluster using ingress |
| identity-and-permissions-manager-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| identity-and-permissions-manager-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| identity-and-permissions-manager-admin.ingress.hosts[0] | object | `{"host":"admin-idp.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| identity-and-permissions-manager-admin.ingress.tls[0] | object | `{"hosts":["admin-idp.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate  |
| identity-and-permissions-manager-admin.idp.role | string | `"admin"` | Define component role/profile |
| identity-and-permissions-manager-admin.idp.whitelist | string | `"[\"*\"]"` | List of all IDP allowed  |
| identity-and-permissions-manager-admin.idp.holderAgent | string | `"http://zorro5g-aries-cloudagent-admin:8001"` | Holder Agent URL |
| identity-and-permissions-manager-admin.idp.issuerAgentUrl | string | `"http://zorro5g-aries-cloudagent-admin:8001"` | Issuer Agent URL |
| identity-and-permissions-manager-admin.idp.tradingProviderAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` | Trading Provider URL |
| identity-and-permissions-manager-admin.idp.regulatorAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` | Regualator Provider URL |
| identity-and-permissions-manager-admin.idp.otherIdpControllers | string | `"[\"http://zorro5g-identity-and-permissions-manager-trader:8000\", \"http://zorro5g-identity-and-permissions-manager-regulator:8000\", \"http://zorro5g-identity-and-permissions-manager-consumer:8000\"]"` | URLs of other IDP controllers |
| identity-and-permissions-manager-admin.idp.adminCatalogueUrl | string | `"http://zorro5g-resource-and-service-offer-catalog-admin:8080/tmf-api/onboardHandler"` | URL of the Resource and Service Offer Catalog instance specific for this profile |
| identity-and-permissions-manager-admin.idp.key | string | `""` |  |
| identity-and-permissions-manager-admin.idp.vpnaasKey | string | `""` |  |
| identity-and-permissions-manager-admin.idp.adminDid | string | `"OD1ndI3xw0Pi6Sl4rgoa6F"` | Admin DID used for the VON registration |
| governance-manager-api-admin.enabled | bool | `true` | Enable 5GZORRO Governance Manager |
| governance-manager-api-admin.postgres.host | string | `"zorro5g-psqldb-admin"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| governance-manager-api-admin.postgres.port | int | `5432` | PostgreSQL port |
| governance-manager-api-admin.postgres.name | string | `"governancemanageradmin"` | PostgreSQL database name |
| governance-manager-api-admin.postgres.existingSecret | string | `"governancemanageradmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| governance-manager-api-admin.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| governance-manager-api-admin.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| governance-manager-api-admin.ingress.enabled | bool | `true` | Exposes the service outside the cluster using ingress |
| governance-manager-api-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| governance-manager-api-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| governance-manager-api-admin.ingress.hosts[0] | object | `{"host":"admin-gm.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| governance-manager-api-admin.ingress.tls[0] | object | `{"hosts":["admin-gm.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate  |
| governance-manager-api-admin.role | string | `"admin"` | Define component role/profile |
| governance-manager-api-admin.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` | URL of the Identity and Permissions Manager instance specific for this profile |
| governance-manager-api-admin.legalProseRepositoryBaseUrl | string | `"http://zorro5g-lagal-prose-repository-admin:8080/legal-prose-repository/api/v1"` | URL of the Legal Prose Repository instance specific for this profile |
| governance-manager-api-admin.callbacks.updateProposal | string | `"https://admin-gm.${HOSTED_ZONE_NAME}/api/v1/governance-actions/%s/identity"` | URL for Governace Manager callback |
| legal-prose-repository-admin.enabled | bool | `true` | Enable 5GZORRO Legal Prose Repository |
| legal-prose-repository-admin.postgres.host | string | `"zorro5g-psqldb-admin"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| legal-prose-repository-admin.postgres.port | int | `5432` | PostgreSQL port |
| legal-prose-repository-admin.postgres.name | string | `"legalproseadmin"` | PostgreSQL database name |
| legal-prose-repository-admin.postgres.existingSecret | string | `"legalproseadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| legal-prose-repository-admin.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| legal-prose-repository-admin.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| legal-prose-repository-admin.ingress.enabled | bool | `true` | Exposes the service outside the cluster using ingress |
| legal-prose-repository-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| legal-prose-repository-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| legal-prose-repository-admin.ingress.hosts[0] | object | `{"host":"admin-lpr.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| legal-prose-repository-admin.ingress.tls[0] | object | `{"hosts":["admin-lpr.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate  |
| legal-prose-repository-admin.role | string | `"admin"` | Define component role/profile |
| legal-prose-repository-admin.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` | URL of the Identity and Permissions Manager instance specific for this profile |
| legal-prose-repository-admin.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-admin:8080/api/v1"` | URL of the Governance Manager instance specific for this profile |
| legal-prose-repository-admin.callbacks.updateTemplateIdentity | string | `"https://admin-lpr.${HOSTED_ZONE_NAME}/legal-prose-repository/api/v1/legal-prose-templates/%s/identity"` | URL for Legal Prose Template callback |
| smart-contract-lifecycle-manager-admin.enabled | bool | `true` | Enable 5GZORRO Smart Contract Lifecycle Manager |
| smart-contract-lifecycle-manager-admin.postgres.host | string | `"zorro5g-psqldb-admin"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| smart-contract-lifecycle-manager-admin.postgres.port | int | `5432` | PostgreSQL port |
| smart-contract-lifecycle-manager-admin.postgres.name | string | `"sclmadmin"` | PostgreSQL database name |
| smart-contract-lifecycle-manager-admin.postgres.existingSecret | string | `"sclmadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| smart-contract-lifecycle-manager-admin.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| smart-contract-lifecycle-manager-admin.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| smart-contract-lifecycle-manager-admin.ingress.enabled | bool | `true` | Exposes the service outside the cluster using ingress |
| smart-contract-lifecycle-manager-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| smart-contract-lifecycle-manager-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| smart-contract-lifecycle-manager-admin.ingress.hosts[0] | object | `{"host":"admin-sclm.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| smart-contract-lifecycle-manager-admin.ingress.tls[0] | object | `{"hosts":["admin-sclm.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate  |
| smart-contract-lifecycle-manager-admin.role | string | `"admin"` | Define component role/profile |
| smart-contract-lifecycle-manager-admin.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` | URL of the Identity and Permissions Manager instance specific for this profile |
| smart-contract-lifecycle-manager-admin.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-admin:8080/api/v1"` | URL of the Governance Manager instance specific for this profile |
| smart-contract-lifecycle-manager-admin.callbacks | object | `{"updateAgreementIdentity":"https://admin-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/agreement/%s/identity","updateSlaIdentity":"https://admin-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/service-level-agreement/%s/identity"}` | URL for Smart Contract Lifecycle Manager callback |
| smart-contract-lifecycle-manager-admin.corda.username | string | `"user1"` | Corda username |
| smart-contract-lifecycle-manager-admin.corda.password | string | `"test"` | Corda password        |
| smart-contract-lifecycle-manager-admin.corda.host | string | `"10.241.0.10"` | Corda hostname         |
| smart-contract-lifecycle-manager-admin.corda.port | string | `"10012"` | Corda port |
| smart-contract-lifecycle-manager-admin.operatorName | string | `"operatora"` | Operator name  |
| smart-contract-lifecycle-manager-admin.hostname | string | `"smart-contract-lifecycle-manager-admin:8087"` | Smart Contract Lifecycle Manager exposed URL |
| resource-and-service-offer-catalog-admin.enable | bool | `true` | Enable 5GZORRO Resource and Service Offer Catalog |
| resource-and-service-offer-catalog-admin.operatorName | string | `"operatora"` | Operator name |
| resource-and-service-offer-catalog-admin.postgres.host | string | `"zorro5g-psqldb-admin"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| resource-and-service-offer-catalog-admin.postgres.port | int | `5432` | PostgreSQL port |
| resource-and-service-offer-catalog-admin.postgres.name | string | `"rsocadmin"` | PostgreSQL database name |
| resource-and-service-offer-catalog-admin.postgres.existingSecret | string | `"rsocadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| resource-and-service-offer-catalog-admin.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| resource-and-service-offer-catalog-admin.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| resource-and-service-offer-catalog-admin.kafka.bootstrap | string | `"kafka-cluster-kafka-bootstrap:9092"` | Kafka URL |
| resource-and-service-offer-catalog-admin.kafka.offeringsTopic | string | `"dlt-product-offerings"` | Kafka offerings topic |
| resource-and-service-offer-catalog-admin.kafka.ordersTopic | string | `"dlt-product-orders"` | Kafka orders topic |
| resource-and-service-offer-catalog-admin.ingress.enabled | bool | `true` | Expose the service outside the cluster using ingress |
| resource-and-service-offer-catalog-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| resource-and-service-offer-catalog-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| resource-and-service-offer-catalog-admin.ingress.hosts[0] | object | `{"host":"admin-rsoc.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| resource-and-service-offer-catalog-admin.ingress.tls[0] | object | `{"hosts":["admin-rsoc.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate |
| resource-and-service-offer-catalog-admin.role | string | `"admin"` | Define component role/profile |
| resource-and-service-offer-catalog-admin.did.host | string | `"http://zorro5g-identity-and-permissions-manager-admin"` | Hostname of the Identity and Permissions Manager instance specific for this profile |
| resource-and-service-offer-catalog-admin.did.port | string | `"8000"` | Port of the Identity and Permissions Manager instance specific for this profile |
| resource-and-service-offer-catalog-admin.lcm.host | string | `"smart-contract-lifecycle-manager-admin"` | URL of the Resource and Service Offer Catalog instance specific for this profile |
| resource-and-service-offer-catalog-admin.lcm.port | string | `"8087"` | Port of the Resource and Service Offer Catalog instance specific for this profile |
| resource-and-service-offer-catalog-admin.lcm.offerPath | string | `"/product-offer/"` | Product offer API path |
| resource-and-service-offer-catalog-admin.lcm.orderPath | string | `"/product_order/"` | Product order API path |
| resource-and-service-offer-catalog-admin.lcm.issuePath | string | `"/spectoken/derivative/issue"` | Issue API path |
| resource-and-service-offer-catalog-admin.lcm.slaPath | string | `"/api/v1/service-level-agreement/"` | Service level agreement path |
| resource-and-service-offer-catalog-admin.lcm.skipPost | string | `"false"` | Skip post  |
| resource-and-service-offer-catalog-admin.srsd.host | string | `"zorro5g-smart-resource-and-service-discovery-admin"` | Hostname of the Smart Resource and Service Discovery instance specific for this profile |
| resource-and-service-offer-catalog-admin.srsd.port | string | `"5000"` | Port of the Smart Resource and Service Discovery instance specific for this profile |
| resource-and-service-offer-catalog-admin.srsd.requestPath | string | `"/classifyOffer"` | Request API path |
| resource-and-service-offer-catalog-admin.srsd.skipPost | string | `"false"` | Skip post  |
| resource-and-service-offer-catalog-admin.hostname | string | `"resource-and-service-offer-catalog-admin"` | Resource and Service Offer Catalog exposed URL |
| gui-admin.enabled | bool | `true` | Enable 5GZORRO GUI |
| gui-admin.ingress.enabled | bool | `true` | Expose the service outside the cluster using ingress |
| gui-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| gui-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| gui-admin.ingress.hosts[0] | object | `{"host":"admin-gui.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| gui-admin.ingress.tls[0] | object | `{"hosts":["admin-gui.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate |
| gui-admin.role | string | `"admin"` | Define component role/profile |
| gui-admin.marketPlaceUrl | string | `"https://admin-rsoc.${HOSTED_ZONE_NAME}/tmf-api"` | External URL of the Resource and Service Offer Catalog instance specific for this profile |
| gui-admin.legalProseUrl | string | `"https://admin-lpr.${HOSTED_ZONE_NAME}"` | External URL of the Legal Prose Repository instance specific for this profile |
| gui-admin.governanceUrl | string | `"https://admin-gm.${HOSTED_ZONE_NAME}"` | External URL of the Governance Manager instance specific for this profile |
| gui-admin.identityPermissionsUrl | string | `"https://admin-idp.${HOSTED_ZONE_NAME}"` | External URL of the Identity and Permissions Manager instance specific for this profile |
| gui-admin.smartContractUrl | string | `"https://admin-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/"` | External URL of the Smart Contract Lifecycle Manager instance specific for this profile |
| gui-admin.resourceManagerEndpoint | string | `"https://admin-xrm.${HOSTED_ZONE_NAME}"` | External URL of the xRM instance specific for this profile  |
| gui-admin.resourceManagerDiscoveryApiKey | string | `"ce0b0017-843c-4811-bb76-1005733cf3ec"` | xRM discovery API key |
| gui-admin.resourceManagerTraslatorApiKey | string | `"fe6d588b-1d6b-4954-9e26-a334d0d09eed"` | xRM translator API key |
| gui-admin.rappDiscoveryApiKey | string | `"fc7def3f-0490-4c17-931f-6f6e4c759890"` | RAPP discovery API key |
| gui-admin.sliceDiscoveryApiKey | string | `"685be7dc-6ed3-46de-90da-bc21747568a1"` | Intelligent slice and service manager discovery API key |
| gui-admin.ledgerIdentity | string | `"CN=OperatorA,OU=DLT,O=DLT,L=London,C=GB"` | DLT ledger identity |
| gui-admin.srsdUrl | string | `"https://admin-srsd.${HOSTED_ZONE_NAME}"` | URL of the Smart Resource and Service Discovery instance specific for this profile |
| gui-admin.issmUrl | string | `"https://admin-issm.${HOSTED_ZONE_NAME}"` | URL of the Intelligent slice and service manager instance specific for this profile  |
| gui-admin.rappUrl | string | `"http://172.28.3.242:2626"` | URL of the RAPP instance specific for this profile |
| smart-resource-and-service-discovery-admin.enabled | bool | `true` | Enable 5GZORRO Smart Resource and Service Discovery |
| smart-resource-and-service-discovery-admin.ingress.enabled | bool | `true` | Exposes the service outside the cluster using ingress |
| smart-resource-and-service-discovery-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| smart-resource-and-service-discovery-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| smart-resource-and-service-discovery-admin.ingress.hosts[0] | object | `{"host":"admin-srsd.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| smart-resource-and-service-discovery-admin.ingress.tls[0] | object | `{"hosts":["admin-srsd.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate  |
| smart-resource-and-service-discovery-admin.mongo.uri | string | `"mongodb-admin-admin-srsd"` | MongoDB secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials using connection string format) |
| monitoring-data-aggregator-admin.enabled | bool | `true` | Enable 5GZORRO Monitoring Data Aggregator |
| monitoring-data-aggregator-admin.postgres.host | string | `"zorro5g-psqldb-admin"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| monitoring-data-aggregator-admin.postgres.port | int | `5432` | PostgreSQL port |
| monitoring-data-aggregator-admin.postgres.name | string | `"mdaadmin"` | PostgreSQL database name |
| monitoring-data-aggregator-admin.postgres.existingSecret | string | `"mdaadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| monitoring-data-aggregator-admin.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| monitoring-data-aggregator-admin.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| monitoring-data-aggregator-admin.ingress.enabled | bool | `false` | Expose the service outside the cluster using ingress |
| monitoring-data-aggregator-admin.role | string | `"admin"` |  |
| monitoring-data-aggregator-admin.kafka | object | `{"host":"kafka-cluster-kafka-bootstrap","port":9092}` | Define component role/profile |
| monitoring-data-aggregator-admin.kafka.host | string | `"kafka-cluster-kafka-bootstrap"` | Kafka Hostname |
| monitoring-data-aggregator-admin.kafka.port | int | `9092` | Kafka Port |
| xrm-admin.enabled | bool | `true` | Enable 5GZORRO Any Resource Manager (xRM) |
| xrm-admin.role | string | `"admin"` | Define component role/profile |
| xrm-admin.ingress.enabled | bool | `true` | Expose the service outside the cluster using ingress |
| xrm-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| xrm-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| xrm-admin.ingress.hosts[0] | object | `{"host":"admin-xrm.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| xrm-admin.ingress.tls[0] | object | `{"hosts":["admin-xrm.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate |
| xrm-admin.catalogueapp.postgres.host | string | `"zorro5g-psqldb-admin"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| xrm-admin.catalogueapp.postgres.port | int | `5432` | PostgreSQL port |
| xrm-admin.catalogueapp.postgres.name | string | `"xrmcatalogueappadmin"` | PostgreSQL database name |
| xrm-admin.catalogueapp.postgres.existingSecret | string | `"xrmcatalogueappadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| xrm-admin.catalogueapp.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| xrm-admin.catalogueapp.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| xrm-admin.catalogueapp.mano.id | string | `"ZORRO_OSMR10"` | Mano istance ID |
| xrm-admin.catalogueapp.mano.type | string | `"OSMR10"` | Mano typr |
| xrm-admin.catalogueapp.mano.site | string | `"ZORRO_OSM"` | Mano Site |
| xrm-admin.catalogueapp.mano.ip | string | `"osm.${HOSTED_ZONE_NAME}"` | Mano exposed URL  |
| xrm-admin.catalogueapp.mano.port | string | `"80"` | Mano port |
| xrm-admin.catalogueapp.mano.username | string | `"admin"` | Mano account username |
| xrm-admin.catalogueapp.mano.password | string | `"admin"` | Mano account password |
| xrm-admin.catalogueapp.mano.project | string | `"admin"` | Mano project name |
| xrm-admin.catalogueapp.catalogue.id | string | `"DEFAULT_CAT"` | Resource and Service Offer Catalog ID |
| xrm-admin.catalogueapp.catalogue.url | string | `"http://zorro5g-resource-and-service-offer-catalog-admin:8080"` | URL of the Resource and Service Offer Catalog instance specific for this profile |
| xrm-admin.catalogueui.keycloak.enabled | bool | `false` | Enable keycloak for xRM catalogue GUI |
| xrm-admin.catalogueui.catalogue.port | string | `"80"` | xRM catalogue GUI port |
| xrm-admin.catalogueui.catalogue.scope | string | `"PUBLIC"` | xRM catalogue GUI scope |
| xrm-admin.kafka.host | string | `"kafka-cluster-kafka-bootstrap:9092"` | Kafka URL |
| xrm-admin.gateway.mongo.uri | string | `"mongodb-admin-admin-xrm-admin"` | MongoDB secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials using connection string format) |
| xrm-admin.managementapi.mongo.uri | string | `"mongodb-admin-admin-xrm-admin"` | MongoDB secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials using connection string format) |
| xrm-admin.translator.postgres.host | string | `"zorro5g-psqldb-admin"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| xrm-admin.translator.postgres.port | int | `5432` | PostgreSQL port |
| xrm-admin.translator.postgres.name | string | `"xrmtranslatoradmin"` | PostgreSQL database name |
| xrm-admin.translator.postgres.existingSecret | string | `"xrmtranslatoradmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| xrm-admin.translator.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| xrm-admin.translator.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| issm-admin.enabled | bool | `true` | Enable 5GZORRO Intelligent Slice and Service Manager |
| issm-admin.role | string | `"admin"` | Define component role/profile |
| issm-admin.orchestrator | string | `"nsso"` | ISSM orchestrator type |
| issm-admin.operatorName | string | `"operatora"` | Operator name |
| issm-admin.kafka.url | string | `"kafka-cluster-kafka-bootstrap.default.svc.cluster.local"` | Kafka Hostname |
| issm-admin.kafka.port | string | `"9092"` | Kafka Port |
| issm-admin.ingress.enabled | bool | `true` | Expose the service outside the cluster using ingress |
| issm-admin.ingress.className | string | `"nginx"` | Set ingress controller class |
| issm-admin.ingress.annotations | object | `{"helm.sh/resource-policy":"keep"}` | Ingress annotation |
| issm-admin.ingress.hosts[0] | object | `{"host":"admin-issm.${HOSTED_ZONE_NAME}","paths":[{"path":"/","pathType":"Prefix"}]}` | Domain used to expose the service outside the cluster |
| issm-admin.ingress.tls[0] | object | `{"hosts":["admin-issm.${HOSTED_ZONE_NAME}"],"secretName":"5gzorro-wildcard-cert"}` | Secret name that contain wildcard certificate |
| issm-admin.argo.internal | string | `"zorro5g-argo-workflows-server.default.svc.cluster.local:2746"` | Argo internal service URL |
| issm-admin.argo.external | string | `"https://argo.${HOSTED_ZONE_NAME}"` | Argo external service URL |
| nsso-admin.enabled | bool | `true` | Enable 5GZORRO Network Slice and Service Orchestrator |
| nsso-admin.role | string | `"admin"` | Define component role/profile |
| nsso-admin.postgres.url | string | `"jdbc:postgresql://zorro5g-psqldb-admin:5432/nssoadmin?sslmode=require"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| nsso-admin.postgres.existingSecret | string | `"nssoadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| nsso-admin.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| nsso-admin.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| nsso-admin.nfvo.catalogue.type | string | `"OSM10"` | Mano type |
| nsso-admin.nfvo.catalogue.address | string | `"http://osm.${HOSTED_ZONE_NAME}"` | Mano exposed URL |
| nsso-admin.nfvo.lcm.type | string | `"OSM10"` | Mano type |
| nsso-admin.nfvo.lcm.address | string | `"http://osm.${HOSTED_ZONE_NAME}"` | Mano exposed URL |
| nsso-admin.nfvo.lcm.project | string | `"admin"` | Mano project name |
| nsso-admin.nfvo.lcm.username | string | `"admin"` | Mano account username |
| nsso-admin.nfvo.lcm.password | string | `"admin"` | Mano account password |
| nsso-admin.rabbitmq.host | string | `"zorro5g-nsso-admin-rabbitmq"` | Rabbitmq cluster hostname |
| trmf-admin.enabled | bool | `true` | Enable 5GZORRO Trust and Reputation Management Framework |
| trmf-admin.role | string | `"admin"` | Define component role/profile |
| trmf-admin.trmfdb.persistence | object | `{"size":"8Gi","storageClassName":"default"}` | Persistence configuration for TRMF internal database |
| trmf-admin.catalogue.uri | string | `"http://zorro5g-resource-and-service-offer-catalog-admin:8080/tmf-api/"` | URL of the Resource and Service Offer Catalog instance specific for this profile |
| trmf-admin.elk.uri | string | `"http://zorro5g-xrm-admin-elasticsearch:9200/"` | URL of the ElasticSearch instance specific for this profile |
| trmf-admin.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` | Kafka Hostname |