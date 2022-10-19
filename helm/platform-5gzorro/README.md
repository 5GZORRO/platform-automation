# platform-5gzorro

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | aries-cloudagent-consumer(aries-cloudagent) | 0.1.* |
|  | aries-cloudagent-trader(aries-cloudagent) | 0.1.* |
|  | aries-cloudagent-admin(aries-cloudagent) | 0.1.* |
|  | aries-cloudagent-regulator(aries-cloudagent) | 0.1.* |
|  | custom-resource-5gzorro | 0.1.0 |
|  | datalake | 0.1.0 |
|  | elma-regulator(elma) | 3.1.* |
|  | elma-consumer(elma) | 3.1.* |
|  | elma-trader(elma) | 3.1.* |
|  | elma-admin(elma) | 3.1.* |
|  | governance-manager-api-admin(governance-manager-api) | 0.1.* |
|  | governance-manager-api-regulator(governance-manager-api) | 0.1.* |
|  | gui-regulator(gui) | 0.1.* |
|  | gui-trader(gui) | 0.1.* |
|  | gui-consumer(gui) | 0.1.* |
|  | gui-admin(gui) | 0.1.* |
|  | identity-and-permissions-manager-regulator(identity-and-permissions-manager) | 0.1.* |
|  | identity-and-permissions-manager-consumer(identity-and-permissions-manager) | 0.1.* |
|  | identity-and-permissions-manager-trader(identity-and-permissions-manager) | 0.1.* |
|  | identity-and-permissions-manager-admin(identity-and-permissions-manager) | 0.1.* |
|  | issm-trader(issm) | 0.1.* |
|  | issm-admin(issm) | 0.1.* |
|  | issm-consumer(issm) | 0.1.* |
|  | legal-prose-repository-admin(legal-prose-repository) | 0.1.* |
|  | legal-prose-repository-regulator(legal-prose-repository) | 0.1.* |
|  | monitoring-data-aggregator | 0.1.* |
|  | monitoring-data-aggregator-trader(monitoring-data-aggregator) | 0.1.* |
|  | monitoring-data-aggregator-admin(monitoring-data-aggregator) | 0.1.* |
|  | monitoring-data-aggregator-consumer(monitoring-data-aggregator) | 0.1.* |
|  | monitoring-data-aggregator-regulator(monitoring-data-aggregator) | 0.1.* |
|  | nsso-admin(nsso) | 0.1.* |
|  | nsso-trader(nsso) | 0.1.* |
|  | resource-and-service-offer-catalog-regulator(resource-and-service-offer-catalog) | 0.1.* |
|  | resource-and-service-offer-catalog-consumer(resource-and-service-offer-catalog) | 0.1.* |
|  | resource-and-service-offer-catalog-trader(resource-and-service-offer-catalog) | 0.1.* |
|  | resource-and-service-offer-catalog-admin(resource-and-service-offer-catalog) | 0.1.* |
|  | sla-breach-predictor | 0.1.* |
|  | smart-contract-lifecycle-manager-regulator(smart-contract-lifecycle-manager) | 0.1.* |
|  | smart-contract-lifecycle-manager-admin(smart-contract-lifecycle-manager) | 0.1.* |
|  | smart-contract-lifecycle-manager-trader(smart-contract-lifecycle-manager) | 0.1.* |
|  | smart-contract-lifecycle-manager-consumer(smart-contract-lifecycle-manager) | 0.1.* |
|  | smart-resource-and-service-discovery-consumer(smart-resource-and-service-discovery) | 0.1.* |
|  | smart-resource-and-service-discovery-admin(smart-resource-and-service-discovery) | 0.1.* |
|  | smart-resource-and-service-discovery-regulator(smart-resource-and-service-discovery) | 0.1.* |
|  | smart-resource-and-service-discovery-trader(smart-resource-and-service-discovery) | 0.1.* |
|  | trmf-admin(trmf) | 1.0.* |
|  | trmf-trader(trmf) | 1.0.* |
|  | trmf-consumer(trmf) | 1.0.* |
|  | xrm-trader(xrm) | 0.1.* |
|  | xrm-consumer(xrm) | 0.1.* |
|  | xrm-admin(xrm) | 0.1.* |
|  | xrm-regulator(xrm) | 0.1.* |
| https://argoproj.github.io/argo-helm | argo-events | 2.0.5 |
| https://argoproj.github.io/argo-helm | argo-workflows | 0.19.1 |
| https://charts.bitnami.com/bitnami | external-dns | 6.7.* |
| https://charts.bitnami.com/bitnami | rabbitmq-cluster-operator | 2.7.* |
| https://charts.jetstack.io | cert-manager(cert-manager) | v1.9.1 |
| https://charts.min.io/ | minio | 4.0.* |
| https://grafana.github.io/helm-charts | loki-stack | 2.6.* |
| https://kubernetes.github.io/ingress-nginx | ingress-nginx | 4.3.* |
| https://mongodb.github.io/helm-charts | community-operator | 0.7.5 |
| https://opensource.zalando.com/postgres-operator/charts/postgres-operator | postgres-operator | 1.8.* |
| https://prometheus-community.github.io/helm-charts | kube-prometheus-stack | 36.0.* |
| https://strimzi.io/charts/ | strimzi-kafka-operator | 0.29.* |

## Values

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
| argo-events.crds.install | bool | `false` | Disable CRD creation that can cause problems with umbrella charts |
| datalake.enabled | bool | `true` | Enable 5GZORRO datalake  |
| datalake.image.repository | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro/datalake"` | Docker image repository |
| datalake.image.tag | string | `"fix-psql1"` | Docker image tag Overrides the image tag whose default is the chart appVersion. |
| datalake.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| datalake.namespace | string | `"default"` | Namespace name where datalake will be deployed  |
| datalake.postgres.host | string | `"zorro5g-psqldb-datalake"` | PostgreSQL hostname (service name if it's in the same namespace, FQDN if NOT) |
| datalake.postgres.port | int | `5432` | PostgreSQL port |
| datalake.postgres.name | string | `"datalake"` | PostgreSQL database name |
| datalake.postgres.table | string | `"datalake_metrics"` | PostgreSQL table name |
| datalake.postgres.existingSecret | string | `"datalake.zorro5g-psqldb-datalake.credentials.postgresql.acid.zalan.do"` | PostgreSQL secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| datalake.postgres.userKey | string | `"username"` | PostgreSQL secret username key |
| datalake.postgres.passwordKey | string | `"password"` | PostgreSQL secret password key |
| datalake.kafka.host | string | `"kafka-cluster-kafka-bootstrap"` | Kafka hostname (service name if it's in the same namespace, FQDN if NOT) |
| datalake.kafka.port | string | `"9092"` | Kafka port |
| datalake.minio.host | string | `"minio"` | Minio hostname (service name if it's in the same namespace, FQDN if NOT) |
| datalake.minio.port | string | `"8080"` | Minio port |
| datalake.minio.username | string | `"datalake"` | Minio username |
| datalake.minio.password | string | `"datalake2022"` | Minio password |
| datalake.minio.existingSecret | string | `""` | Minio secrets name (created manually or by custom-resource-5gzorro helm-chart, containing user credentials) |
| datalake.minio.userKey | string | `""` | Minio secret username key |
| datalake.minio.passwordKey | string | `""` | Minio secret password key |
| datalake.datalake.imageVersion | string | `"latest"` | Datalake Docker image tag |
| datalake.datalake.imageRepository | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro"` | Datalake dicker image repository |
| sla-breach-predictor.enabled | bool | `true` | Enable 5GZORRO SLA Breach Predictor |
| sla-breach-predictor.persistence.enabled | bool | `true` | Enable persistence |
| sla-breach-predictor.persistence.storageClassName | string | `"dafault"` | StorageClassName |
| sla-breach-predictor.persistence.size | string | `"128Gi"` | Persistent Volume Claim size |
| sla-breach-predictor.kafka.host | string | `"kafka-cluster-kafka-bootstrap"` | Kafka hostname (service name if it's in the same namespace, FQDN if NOT) |
| sla-breach-predictor.kafka.port | int | `9092` | Kafka port |
| sla-breach-predictor.kafka.monTopic | string | `""` | Kafka monitoring Topic |
| sla-breach-predictor.datalakeHost | string | `"zorro5g-datalake:8080"` | Datalake hostname and port (service name if it's in the same namespace, FQDN if NOT) |
| sla-breach-predictor.lcmHost | string | `"smart-contract-lifecycle-manager-admin:8087"` | Smart Contract Lifecycle Manager hostname and port (service name if it's in the same namespace, FQDN if NOT) |
| elma-admin.enabled | bool | `true` |  |
| elma-admin.role | string | `"admin"` |  |
| elma-admin.domainId | string | `"admin"` |  |
| elma-admin.catalog.url | string | `"zorro5g-resource-and-service-offer-catalog-admin"` |  |
| elma-admin.catalog.port | string | `"8080"` |  |
| elma-admin.catalog.resources | string | `"None"` |  |
| elma-admin.netSlice.url | string | `"172.28.3.15"` |  |
| elma-admin.netSlice.port | string | `"31082"` |  |
| elma-admin.netSlice.endpoint | string | `"portal/elicensing/"` |  |
| elma-admin.datalake.url | string | `"http://zorro5g-datalake:8080/datalake/v1/catalog/instance/{instance_id}"` |  |
| elma-admin.datalake.auth | string | `"{\"userInfo\": {\"userId\": \"operator-a\", \"authToken\": \"blah\"}}"` |  |
| elma-admin.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| elma-admin.image.tag | string | `"latest"` |  |
| elma-admin.image.app | string | `"elma"` |  |
| elma-admin.image.image | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro/elma"` |  |
| elma-admin.image.pullPolicy | string | `"Always"` |  |
| elma-admin.image.pullSecrets | string | `"registry-credentials"` |  |
| elma-admin.rabbitmq.url | string | `"rabbitmq-elma-admin"` |  |
| elma-admin.rabbitmq.existingSecret | string | `"rabbitmq-elma-admin-default-user"` |  |
| elma-admin.rabbitmq.userKey | string | `"username"` |  |
| elma-admin.rabbitmq.passwordKey | string | `"password"` |  |
| aries-cloudagent-admin.enable | bool | `true` |  |
| aries-cloudagent-admin.agent.role | string | `"admin"` |  |
| aries-cloudagent-admin.agent.label | string | `"AgentAdmin"` |  |
| aries-cloudagent-admin.agent.seed | string | `"AgentAdmin0000000000000000000000"` |  |
| aries-cloudagent-admin.agent.did | string | `"RGQ8DpoASL9rZZp69i7wJ8"` |  |
| aries-cloudagent-admin.agent.walletName | string | `"AgentAdmin"` |  |
| aries-cloudagent-admin.agent.walletKey | string | `"AgentAdminKey"` |  |
| aries-cloudagent-admin.vonUrl | string | `"http://10.241.0.10:9000"` |  |
| aries-cloudagent-admin.persistence.enabled | bool | `false` |  |
| aries-cloudagent-admin.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| aries-cloudagent-admin.persistence.size | string | `"10Gi"` |  |
| identity-and-permissions-manager-admin.enabled | bool | `true` |  |
| identity-and-permissions-manager-admin.database.connectionString | string | `"mongodb-admin-admin-idp-admin"` |  |
| identity-and-permissions-manager-admin.database.port | string | `"27017"` |  |
| identity-and-permissions-manager-admin.ingress.enabled | bool | `true` |  |
| identity-and-permissions-manager-admin.ingress.className | string | `"nginx"` |  |
| identity-and-permissions-manager-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| identity-and-permissions-manager-admin.ingress.hosts[0].host | string | `"admin-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| identity-and-permissions-manager-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| identity-and-permissions-manager-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| identity-and-permissions-manager-admin.ingress.tls[0].hosts[0] | string | `"admin-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-admin.idp.role | string | `"admin"` |  |
| identity-and-permissions-manager-admin.idp.whitelist | string | `"[\"*\"]"` |  |
| identity-and-permissions-manager-admin.idp.holderAgent | string | `"http://zorro5g-aries-cloudagent-admin:8001"` |  |
| identity-and-permissions-manager-admin.idp.issuerAgentUrl | string | `"http://zorro5g-aries-cloudagent-admin:8001"` |  |
| identity-and-permissions-manager-admin.idp.tradingProviderAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` |  |
| identity-and-permissions-manager-admin.idp.regulatorAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` |  |
| identity-and-permissions-manager-admin.idp.otherIdpControllers | string | `"[\"http://zorro5g-identity-and-permissions-manager-trader:8000\", \"http://zorro5g-identity-and-permissions-manager-regulator:8000\", \"http://zorro5g-identity-and-permissions-manager-consumer:8000\"]"` |  |
| identity-and-permissions-manager-admin.idp.adminCatalogueUrl | string | `"http://zorro5g-resource-and-service-offer-catalog-admin:8080/tmf-api/onboardHandler"` |  |
| identity-and-permissions-manager-admin.idp.key | string | `""` |  |
| identity-and-permissions-manager-admin.idp.vpnaasKey | string | `""` |  |
| identity-and-permissions-manager-admin.idp.adminDid | string | `"OD1ndI3xw0Pi6Sl4rgoa6F"` |  |
| governance-manager-api-admin.enabled | bool | `true` |  |
| governance-manager-api-admin.postgres.host | string | `"zorro5g-psqldb-admin"` |  |
| governance-manager-api-admin.postgres.port | int | `5432` |  |
| governance-manager-api-admin.postgres.name | string | `"governancemanageradmin"` |  |
| governance-manager-api-admin.postgres.existingSecret | string | `"governancemanageradmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| governance-manager-api-admin.postgres.userKey | string | `"username"` |  |
| governance-manager-api-admin.postgres.passwordKey | string | `"password"` |  |
| governance-manager-api-admin.ingress.enabled | bool | `true` |  |
| governance-manager-api-admin.ingress.className | string | `"nginx"` |  |
| governance-manager-api-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| governance-manager-api-admin.ingress.hosts[0].host | string | `"admin-gm.${HOSTED_ZONE_NAME}"` |  |
| governance-manager-api-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| governance-manager-api-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| governance-manager-api-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| governance-manager-api-admin.ingress.tls[0].hosts[0] | string | `"admin-gm.${HOSTED_ZONE_NAME}"` |  |
| governance-manager-api-admin.role | string | `"admin"` |  |
| governance-manager-api-admin.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` |  |
| governance-manager-api-admin.legalProseRepositoryBaseUrl | string | `"http://zorro5g-lagal-prose-repository-admin:8080/legal-prose-repository/api/v1"` |  |
| governance-manager-api-admin.callbacks.updateProposal | string | `"https://admin-gm.${HOSTED_ZONE_NAME}/api/v1/governance-actions/%s/identity"` |  |
| legal-prose-repository-admin.enabled | bool | `true` |  |
| legal-prose-repository-admin.postgres.host | string | `"zorro5g-psqldb-admin"` |  |
| legal-prose-repository-admin.postgres.port | int | `5432` |  |
| legal-prose-repository-admin.postgres.name | string | `"legalproseadmin"` |  |
| legal-prose-repository-admin.postgres.existingSecret | string | `"legalproseadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| legal-prose-repository-admin.postgres.userKey | string | `"username"` |  |
| legal-prose-repository-admin.postgres.passwordKey | string | `"password"` |  |
| legal-prose-repository-admin.ingress.enabled | bool | `true` |  |
| legal-prose-repository-admin.ingress.className | string | `"nginx"` |  |
| legal-prose-repository-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| legal-prose-repository-admin.ingress.hosts[0].host | string | `"admin-lpr.${HOSTED_ZONE_NAME}"` |  |
| legal-prose-repository-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| legal-prose-repository-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| legal-prose-repository-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| legal-prose-repository-admin.ingress.tls[0].hosts[0] | string | `"admin-lpr.${HOSTED_ZONE_NAME}"` |  |
| legal-prose-repository-admin.role | string | `"admin"` |  |
| legal-prose-repository-admin.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` |  |
| legal-prose-repository-admin.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-admin:8080/api/v1"` |  |
| legal-prose-repository-admin.callbacks.updateTemplateIdentity | string | `"https://admin-lpr.${HOSTED_ZONE_NAME}/legal-prose-repository/api/v1/legal-prose-templates/%s/identity"` |  |
| smart-contract-lifecycle-manager-admin.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-admin.postgres.host | string | `"zorro5g-psqldb-admin"` |  |
| smart-contract-lifecycle-manager-admin.postgres.port | int | `5432` |  |
| smart-contract-lifecycle-manager-admin.postgres.name | string | `"sclmadmin"` |  |
| smart-contract-lifecycle-manager-admin.postgres.existingSecret | string | `"sclmadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| smart-contract-lifecycle-manager-admin.postgres.userKey | string | `"username"` |  |
| smart-contract-lifecycle-manager-admin.postgres.passwordKey | string | `"password"` |  |
| smart-contract-lifecycle-manager-admin.ingress.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-admin.ingress.className | string | `"nginx"` |  |
| smart-contract-lifecycle-manager-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-contract-lifecycle-manager-admin.ingress.hosts[0].host | string | `"admin-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-contract-lifecycle-manager-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-contract-lifecycle-manager-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-contract-lifecycle-manager-admin.ingress.tls[0].hosts[0] | string | `"admin-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-admin.role | string | `"admin"` |  |
| smart-contract-lifecycle-manager-admin.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` |  |
| smart-contract-lifecycle-manager-admin.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-admin:8080/api/v1"` |  |
| smart-contract-lifecycle-manager-admin.callbacks.updateSlaIdentity | string | `"https://admin-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/service-level-agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-admin.callbacks.updateAgreementIdentity | string | `"https://admin-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-admin.corda.username | string | `"user1"` |  |
| smart-contract-lifecycle-manager-admin.corda.password | string | `"test"` |  |
| smart-contract-lifecycle-manager-admin.corda.host | string | `"10.241.0.10"` |  |
| smart-contract-lifecycle-manager-admin.corda.port | string | `"10012"` |  |
| smart-contract-lifecycle-manager-admin.operatorName | string | `"operatora"` |  |
| smart-contract-lifecycle-manager-admin.hostname | string | `"smart-contract-lifecycle-manager-admin:8087"` |  |
| resource-and-service-offer-catalog-admin.enable | bool | `true` |  |
| resource-and-service-offer-catalog-admin.operatorName | string | `"operatora"` |  |
| resource-and-service-offer-catalog-admin.postgres.host | string | `"zorro5g-psqldb-admin"` |  |
| resource-and-service-offer-catalog-admin.postgres.port | int | `5432` |  |
| resource-and-service-offer-catalog-admin.postgres.name | string | `"rsocadmin"` |  |
| resource-and-service-offer-catalog-admin.postgres.existingSecret | string | `"rsocadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| resource-and-service-offer-catalog-admin.postgres.userKey | string | `"username"` |  |
| resource-and-service-offer-catalog-admin.postgres.passwordKey | string | `"password"` |  |
| resource-and-service-offer-catalog-admin.kafka.bootstrap | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| resource-and-service-offer-catalog-admin.kafka.offeringsTopic | string | `"dlt-product-offerings"` |  |
| resource-and-service-offer-catalog-admin.kafka.ordersTopic | string | `"dlt-product-orders"` |  |
| resource-and-service-offer-catalog-admin.ingress.enabled | bool | `true` |  |
| resource-and-service-offer-catalog-admin.ingress.className | string | `"nginx"` |  |
| resource-and-service-offer-catalog-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| resource-and-service-offer-catalog-admin.ingress.hosts[0].host | string | `"admin-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| resource-and-service-offer-catalog-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| resource-and-service-offer-catalog-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| resource-and-service-offer-catalog-admin.ingress.tls[0].hosts[0] | string | `"admin-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-admin.role | string | `"admin"` |  |
| resource-and-service-offer-catalog-admin.did.host | string | `"http://zorro5g-identity-and-permissions-manager-admin"` |  |
| resource-and-service-offer-catalog-admin.did.port | string | `"8000"` |  |
| resource-and-service-offer-catalog-admin.lcm.host | string | `"smart-contract-lifecycle-manager-admin"` |  |
| resource-and-service-offer-catalog-admin.lcm.port | string | `"8087"` |  |
| resource-and-service-offer-catalog-admin.lcm.offerPath | string | `"/product-offer/"` |  |
| resource-and-service-offer-catalog-admin.lcm.orderPath | string | `"/product_order/"` |  |
| resource-and-service-offer-catalog-admin.lcm.issuePath | string | `"/spectoken/derivative/issue"` |  |
| resource-and-service-offer-catalog-admin.lcm.slaPath | string | `"/api/v1/service-level-agreement/"` |  |
| resource-and-service-offer-catalog-admin.lcm.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-admin.srsd.host | string | `"zorro5g-smart-resource-and-service-discovery-admin"` |  |
| resource-and-service-offer-catalog-admin.srsd.port | string | `"5000"` |  |
| resource-and-service-offer-catalog-admin.srsd.requestPath | string | `"/classifyOffer"` |  |
| resource-and-service-offer-catalog-admin.srsd.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-admin.hostname | string | `"resource-and-service-offer-catalog-admin"` |  |
| gui-admin.enabled | bool | `true` |  |
| gui-admin.ingress.enabled | bool | `true` |  |
| gui-admin.ingress.className | string | `"nginx"` |  |
| gui-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| gui-admin.ingress.hosts[0].host | string | `"admin-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| gui-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| gui-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| gui-admin.ingress.tls[0].hosts[0] | string | `"admin-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-admin.role | string | `"admin"` |  |
| gui-admin.marketPlaceUrl | string | `"https://admin-rsoc.${HOSTED_ZONE_NAME}/tmf-api"` |  |
| gui-admin.legalProseUrl | string | `"https://admin-lpr.${HOSTED_ZONE_NAME}"` |  |
| gui-admin.governanceUrl | string | `"https://admin-gm.${HOSTED_ZONE_NAME}"` |  |
| gui-admin.identityPermissionsUrl | string | `"https://admin-idp.${HOSTED_ZONE_NAME}"` |  |
| gui-admin.smartContractUrl | string | `"https://admin-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/"` |  |
| gui-admin.resourceManagerEndpoint | string | `"http://172.28.3.15:31081"` |  |
| gui-admin.resourceManagerDiscoveryApiKey | string | `"ce0b0017-843c-4811-bb76-1005733cf3ec"` |  |
| gui-admin.resourceManagerTraslatorApiKey | string | `"fe6d588b-1d6b-4954-9e26-a334d0d09eed"` |  |
| gui-admin.rappDiscoveryApiKey | string | `"fc7def3f-0490-4c17-931f-6f6e4c759890"` |  |
| gui-admin.sliceDiscoveryApiKey | string | `"685be7dc-6ed3-46de-90da-bc21747568a1"` |  |
| gui-admin.ledgerIdentity | string | `"CN=OperatorA,OU=DLT,O=DLT,L=London,C=GB"` |  |
| gui-admin.srsdUrl | string | `"https://admin-srsd.${HOSTED_ZONE_NAME}"` |  |
| gui-admin.issmUrl | string | `"https://admin-issm.${HOSTED_ZONE_NAME}"` |  |
| gui-admin.rappUrl | string | `"http://172.28.3.242:2626"` |  |
| smart-resource-and-service-discovery-admin.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-admin.ingress.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-admin.ingress.className | string | `"nginx"` |  |
| smart-resource-and-service-discovery-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-resource-and-service-discovery-admin.ingress.hosts[0].host | string | `"admin-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-resource-and-service-discovery-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-resource-and-service-discovery-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-resource-and-service-discovery-admin.ingress.tls[0].hosts[0] | string | `"admin-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-admin.mongo.uri | string | `"mongodb-admin-admin-srsd"` |  |
| monitoring-data-aggregator-admin.enabled | bool | `true` |  |
| monitoring-data-aggregator-admin.postgres.host | string | `"zorro5g-psqldb-admin"` |  |
| monitoring-data-aggregator-admin.postgres.port | int | `5432` |  |
| monitoring-data-aggregator-admin.postgres.name | string | `"mdaadmin"` |  |
| monitoring-data-aggregator-admin.postgres.existingSecret | string | `"mdaadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| monitoring-data-aggregator-admin.postgres.userKey | string | `"username"` |  |
| monitoring-data-aggregator-admin.postgres.passwordKey | string | `"password"` |  |
| monitoring-data-aggregator-admin.ingress.enabled | bool | `false` |  |
| monitoring-data-aggregator-admin.role | string | `"admin"` |  |
| monitoring-data-aggregator-admin.kafka.host | string | `"kafka-cluster-kafka-bootstrap"` |  |
| monitoring-data-aggregator-admin.kafka.port | int | `9092` |  |
| xrm-admin.role | string | `"admin"` |  |
| xrm-admin.catalogueapp.postgres.host | string | `"zorro5g-psqldb-admin"` |  |
| xrm-admin.catalogueapp.postgres.port | int | `5432` |  |
| xrm-admin.catalogueapp.postgres.name | string | `"xrmcatalogueappadmin"` |  |
| xrm-admin.catalogueapp.postgres.existingSecret | string | `"xrmcatalogueappadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| xrm-admin.catalogueapp.postgres.userKey | string | `"username"` |  |
| xrm-admin.catalogueapp.postgres.passwordKey | string | `"password"` |  |
| xrm-admin.catalogueapp.mano.id | string | `"ZORRO_OSMR10"` |  |
| xrm-admin.catalogueapp.mano.type | string | `"OSMR10"` |  |
| xrm-admin.catalogueapp.mano.site | string | `"ZORRO_OSM"` |  |
| xrm-admin.catalogueapp.mano.ip | string | `"osm.${HOSTED_ZONE_NAME}"` |  |
| xrm-admin.catalogueapp.mano.port | string | `"80"` |  |
| xrm-admin.catalogueapp.mano.username | string | `"admin"` |  |
| xrm-admin.catalogueapp.mano.password | string | `"admin"` |  |
| xrm-admin.catalogueapp.mano.project | string | `"admin"` |  |
| xrm-admin.catalogueapp.catalogue.id | string | `"DEFAULT_CAT"` |  |
| xrm-admin.catalogueapp.catalogue.url | string | `"http://zorro5g-resource-and-service-offer-catalog-admin:8080"` |  |
| xrm-admin.catalogueui.keycloak.enabled | bool | `false` |  |
| xrm-admin.catalogueui.catalogue.port | string | `"80"` |  |
| xrm-admin.catalogueui.catalogue.scope | string | `"PUBLIC"` |  |
| xrm-admin.kafka.host | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| xrm-admin.gateway.mongo.uri | string | `"mongodb-admin-admin-xrm-admin"` |  |
| xrm-admin.managementapi.mongo.uri | string | `"mongodb-admin-admin-xrm-admin"` |  |
| xrm-admin.translator.postgres.host | string | `"zorro5g-psqldb-admin"` |  |
| xrm-admin.translator.postgres.port | int | `5432` |  |
| xrm-admin.translator.postgres.name | string | `"xrmtranslatoradmin"` |  |
| xrm-admin.translator.postgres.existingSecret | string | `"xrmtranslatoradmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| xrm-admin.translator.postgres.userKey | string | `"username"` |  |
| xrm-admin.translator.postgres.passwordKey | string | `"password"` |  |
| issm-admin.enabled | bool | `true` |  |
| issm-admin.role | string | `"admin"` |  |
| issm-admin.orchestrator | string | `"nsso"` |  |
| issm-admin.operatorName | string | `"operatora"` |  |
| issm-admin.kafka.url | string | `"kafka-cluster-kafka-bootstrap.default.svc.cluster.local"` |  |
| issm-admin.kafka.port | string | `"9092"` |  |
| issm-admin.ingress.enabled | bool | `true` |  |
| issm-admin.ingress.className | string | `"nginx"` |  |
| issm-admin.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| issm-admin.ingress.hosts[0].host | string | `"admin-issm.${HOSTED_ZONE_NAME}"` |  |
| issm-admin.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| issm-admin.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| issm-admin.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| issm-admin.ingress.tls[0].hosts[0] | string | `"admin-issm.${HOSTED_ZONE_NAME}"` |  |
| issm-admin.argo.internal | string | `"zorro5g-argo-workflows-server.default.svc.cluster.local:2746"` |  |
| issm-admin.argo.external | string | `"https://argo.${HOSTED_ZONE_NAME}"` |  |
| nsso-admin.enabled | bool | `true` |  |
| nsso-admin.role | string | `"admin"` |  |
| nsso-admin.postgres.url | string | `"jdbc:postgresql://zorro5g-psqldb-admin:5432/nssoadmin?sslmode=require"` |  |
| nsso-admin.postgres.existingSecret | string | `"nssoadmin.zorro5g-psqldb-admin.credentials.postgresql.acid.zalan.do"` |  |
| nsso-admin.postgres.userKey | string | `"username"` |  |
| nsso-admin.postgres.passwordKey | string | `"password"` |  |
| nsso-admin.nfvo.catalogue.type | string | `"OSM10"` |  |
| nsso-admin.nfvo.catalogue.address | string | `"http://osm.${HOSTED_ZONE_NAME}"` |  |
| nsso-admin.nfvo.lcm.type | string | `"OSM10"` |  |
| nsso-admin.nfvo.lcm.address | string | `"http://osm.${HOSTED_ZONE_NAME}"` |  |
| nsso-admin.nfvo.lcm.project | string | `"admin"` |  |
| nsso-admin.nfvo.lcm.username | string | `"admin"` |  |
| nsso-admin.nfvo.lcm.password | string | `"admin"` |  |
| nsso-admin.rabbitmq.host | string | `"zorro5g-nsso-admin-rabbitmq"` |  |
| trmf-admin.enabled | bool | `true` |  |
| trmf-admin.role | string | `"admin"` |  |
| trmf-admin.trmfdb.persistence.storageClassName | string | `"default"` |  |
| trmf-admin.trmfdb.persistence.size | string | `"8Gi"` |  |
| trmf-admin.catalogue.uri | string | `"http://zorro5g-resource-and-service-offer-catalog-admin:8080/tmf-api/"` |  |
| trmf-admin.elk.uri | string | `"http://zorro5g-xrm-admin-elasticsearch:9200/"` |  |
| trmf-admin.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| elma-regulator.enabled | bool | `true` |  |
| elma-regulator.role | string | `"regulator"` |  |
| elma-regulator.domainId | string | `"regulator"` |  |
| elma-regulator.catalog.url | string | `"zorro5g-resource-and-service-offer-catalog-regulator"` |  |
| elma-regulator.catalog.port | string | `"8080"` |  |
| elma-regulator.catalog.resources | string | `"None"` |  |
| elma-regulator.netSlice.url | string | `"172.28.3.15"` |  |
| elma-regulator.netSlice.port | string | `"31082"` |  |
| elma-regulator.netSlice.endpoint | string | `"portal/elicensing/"` |  |
| elma-regulator.datalake.url | string | `"http://zorro5g-datalake:8080/datalake/v1/catalog/instance/{instance_id}"` |  |
| elma-regulator.datalake.auth | string | `"{\"userInfo\": {\"userId\": \"operator-b\", \"authToken\": \"blah\"}}"` |  |
| elma-regulator.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| elma-regulator.image.tag | string | `"latest"` |  |
| elma-regulator.image.app | string | `"elma"` |  |
| elma-regulator.image.image | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro/elma"` |  |
| elma-regulator.image.pullPolicy | string | `"Always"` |  |
| elma-regulator.image.pullSecrets | string | `"registry-credentials"` |  |
| elma-regulator.rabbitmq.url | string | `"rabbitmq-elma-regulator"` |  |
| elma-regulator.rabbitmq.existingSecret | string | `"rabbitmq-elma-regulator-default-user"` |  |
| elma-regulator.rabbitmq.userKey | string | `"username"` |  |
| elma-regulator.rabbitmq.passwordKey | string | `"password"` |  |
| aries-cloudagent-regulator.enable | bool | `true` |  |
| aries-cloudagent-regulator.agent.role | string | `"regulator"` |  |
| aries-cloudagent-regulator.agent.label | string | `"AgentRegualtor"` |  |
| aries-cloudagent-regulator.agent.seed | string | `"AgentRegulator000000000000000000"` |  |
| aries-cloudagent-regulator.agent.did | string | `"KhgK8deVdK93xbTqkVMzVs"` |  |
| aries-cloudagent-regulator.agent.walletName | string | `"AgentRegualtor"` |  |
| aries-cloudagent-regulator.agent.walletKey | string | `"AgentRegulatorKey"` |  |
| aries-cloudagent-regulator.vonUrl | string | `"http://10.241.0.10:9000"` |  |
| aries-cloudagent-regulator.persistence.enabled | bool | `false` |  |
| aries-cloudagent-regulator.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| aries-cloudagent-regulator.persistence.size | string | `"10Gi"` |  |
| identity-and-permissions-manager-regulator.enabled | bool | `true` |  |
| identity-and-permissions-manager-regulator.database.connectionString | string | `"mongodb-regulator-admin-idp-regulator"` |  |
| identity-and-permissions-manager-regulator.database.port | string | `""` |  |
| identity-and-permissions-manager-regulator.ingress.enabled | bool | `true` |  |
| identity-and-permissions-manager-regulator.ingress.className | string | `"nginx"` |  |
| identity-and-permissions-manager-regulator.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| identity-and-permissions-manager-regulator.ingress.hosts[0].host | string | `"regulator-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-regulator.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| identity-and-permissions-manager-regulator.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| identity-and-permissions-manager-regulator.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| identity-and-permissions-manager-regulator.ingress.tls[0].hosts[0] | string | `"regulator-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-regulator.idp.role | string | `"regulator"` |  |
| identity-and-permissions-manager-regulator.idp.whitelist | string | `"[\"*\"]"` |  |
| identity-and-permissions-manager-regulator.idp.holderAgent | string | `"http://zorro5g-aries-cloudagent-regulator:8001"` |  |
| identity-and-permissions-manager-regulator.idp.issuerAgentUrl | string | `"http://zorro5g-aries-cloudagent-regulator:8001"` |  |
| identity-and-permissions-manager-regulator.idp.tradingProviderAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` |  |
| identity-and-permissions-manager-regulator.idp.adminAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` |  |
| identity-and-permissions-manager-regulator.idp.otherIdpControllers | string | `"[\"http://zorro5g-identity-and-permissions-manager-trader:8000\", \"http://zorro5g-identity-and-permissions-manager-admin:8000\", \"http://zorro5g-identity-and-permissions-manager-consumer:8000\" ]"` |  |
| identity-and-permissions-manager-regulator.idp.key | string | `""` |  |
| identity-and-permissions-manager-regulator.idp.vpnaasKey | string | `""` |  |
| governance-manager-api-regulator.enabled | bool | `true` |  |
| governance-manager-api-regulator.postgres.host | string | `"zorro5g-psqldb-regulator"` |  |
| governance-manager-api-regulator.postgres.port | int | `5432` |  |
| governance-manager-api-regulator.postgres.name | string | `"governancemanagerregulator"` |  |
| governance-manager-api-regulator.postgres.existingSecret | string | `"governancemanagerregulator.zorro5g-psqldb-regulator.credentials.postgresql.acid.zalan.do"` |  |
| governance-manager-api-regulator.postgres.userKey | string | `"username"` |  |
| governance-manager-api-regulator.postgres.passwordKey | string | `"password"` |  |
| governance-manager-api-regulator.ingress.enabled | bool | `true` |  |
| governance-manager-api-regulator.ingress.className | string | `"nginx"` |  |
| governance-manager-api-regulator.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| governance-manager-api-regulator.ingress.hosts[0].host | string | `"regulator-gm.${HOSTED_ZONE_NAME}"` |  |
| governance-manager-api-regulator.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| governance-manager-api-regulator.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| governance-manager-api-regulator.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| governance-manager-api-regulator.ingress.tls[0].hosts[0] | string | `"regulator-gm.${HOSTED_ZONE_NAME}"` |  |
| governance-manager-api-regulator.role | string | `"regulator"` |  |
| governance-manager-api-regulator.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` |  |
| governance-manager-api-regulator.legalProseRepositoryBaseUrl | string | `"http://zorro5g-lagal-prose-repository-regulator:8080/legal-prose-repository/api/v1"` |  |
| governance-manager-api-regulator.callbacks.updateProposal | string | `"https://regulator-gm.${HOSTED_ZONE_NAME}/api/v1/governance-actions/%s/identity"` |  |
| legal-prose-repository-regulator.enabled | bool | `true` |  |
| legal-prose-repository-regulator.postgres.host | string | `"zorro5g-psqldb-regulator"` |  |
| legal-prose-repository-regulator.postgres.port | int | `5432` |  |
| legal-prose-repository-regulator.postgres.name | string | `"legalproseregulator"` |  |
| legal-prose-repository-regulator.postgres.existingSecret | string | `"legalproseregulator.zorro5g-psqldb-regulator.credentials.postgresql.acid.zalan.do"` |  |
| legal-prose-repository-regulator.postgres.userKey | string | `"username"` |  |
| legal-prose-repository-regulator.postgres.passwordKey | string | `"password"` |  |
| legal-prose-repository-regulator.ingress.enabled | bool | `true` |  |
| legal-prose-repository-regulator.ingress.className | string | `"nginx"` |  |
| legal-prose-repository-regulator.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| legal-prose-repository-regulator.ingress.hosts[0].host | string | `"regulator-lpr.${HOSTED_ZONE_NAME}"` |  |
| legal-prose-repository-regulator.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| legal-prose-repository-regulator.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| legal-prose-repository-regulator.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| legal-prose-repository-regulator.ingress.tls[0].hosts[0] | string | `"regulator-lpr.${HOSTED_ZONE_NAME}"` |  |
| legal-prose-repository-regulator.role | string | `"regulator"` |  |
| legal-prose-repository-regulator.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` |  |
| legal-prose-repository-regulator.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-regulator:8080/api/v1"` |  |
| legal-prose-repository-regulator.callbacks.updateTemplateIdentity | string | `"https://regulator-lpr.${HOSTED_ZONE_NAME}/legal-prose-repository/api/v1/legal-prose-templates/%s/identity"` |  |
| smart-contract-lifecycle-manager-regulator.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-regulator.postgres.host | string | `"zorro5g-psqldb-regulator"` |  |
| smart-contract-lifecycle-manager-regulator.postgres.port | int | `5432` |  |
| smart-contract-lifecycle-manager-regulator.postgres.name | string | `"sclmregulator"` |  |
| smart-contract-lifecycle-manager-regulator.postgres.existingSecret | string | `"sclmregulator.zorro5g-psqldb-regulator.credentials.postgresql.acid.zalan.do"` |  |
| smart-contract-lifecycle-manager-regulator.postgres.userKey | string | `"username"` |  |
| smart-contract-lifecycle-manager-regulator.postgres.passwordKey | string | `"password"` |  |
| smart-contract-lifecycle-manager-regulator.ingress.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-regulator.ingress.className | string | `"nginx"` |  |
| smart-contract-lifecycle-manager-regulator.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-contract-lifecycle-manager-regulator.ingress.hosts[0].host | string | `"regulator-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-regulator.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-contract-lifecycle-manager-regulator.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-contract-lifecycle-manager-regulator.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-contract-lifecycle-manager-regulator.ingress.tls[0].hosts[0] | string | `"regulator-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-regulator.role | string | `"regulator"` |  |
| smart-contract-lifecycle-manager-regulator.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` |  |
| smart-contract-lifecycle-manager-regulator.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-regulator:8080/api/v1"` |  |
| smart-contract-lifecycle-manager-regulator.callbacks.updateSlaIdentity | string | `"https://regulator-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/service-level-agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-regulator.callbacks.updateAgreementIdentity | string | `"https://regulator-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-regulator.corda.username | string | `"user1"` |  |
| smart-contract-lifecycle-manager-regulator.corda.password | string | `"test"` |  |
| smart-contract-lifecycle-manager-regulator.corda.host | string | `"10.241.0.10"` |  |
| smart-contract-lifecycle-manager-regulator.corda.port | string | `"10015"` |  |
| smart-contract-lifecycle-manager-regulator.operatorName | string | `"regualtora"` |  |
| smart-contract-lifecycle-manager-regulator.hostname | string | `"smart-contract-lifecycle-manager-regulator:8087"` |  |
| resource-and-service-offer-catalog-regulator.enable | bool | `true` |  |
| resource-and-service-offer-catalog-regulator.operatorName | string | `"regulatora"` |  |
| resource-and-service-offer-catalog-regulator.postgres.host | string | `"zorro5g-psqldb-regulator"` |  |
| resource-and-service-offer-catalog-regulator.postgres.port | int | `5432` |  |
| resource-and-service-offer-catalog-regulator.postgres.name | string | `"rsocregulator"` |  |
| resource-and-service-offer-catalog-regulator.postgres.existingSecret | string | `"rsocregulator.zorro5g-psqldb-regulator.credentials.postgresql.acid.zalan.do"` |  |
| resource-and-service-offer-catalog-regulator.postgres.userKey | string | `"username"` |  |
| resource-and-service-offer-catalog-regulator.postgres.passwordKey | string | `"password"` |  |
| resource-and-service-offer-catalog-regulator.kafka.bootstrap | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| resource-and-service-offer-catalog-regulator.kafka.offeringsTopic | string | `"dlt-product-offerings"` |  |
| resource-and-service-offer-catalog-regulator.kafka.ordersTopic | string | `"dlt-product-orders"` |  |
| resource-and-service-offer-catalog-regulator.ingress.enabled | bool | `true` |  |
| resource-and-service-offer-catalog-regulator.ingress.className | string | `"nginx"` |  |
| resource-and-service-offer-catalog-regulator.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| resource-and-service-offer-catalog-regulator.ingress.hosts[0].host | string | `"regulator-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-regulator.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| resource-and-service-offer-catalog-regulator.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| resource-and-service-offer-catalog-regulator.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| resource-and-service-offer-catalog-regulator.ingress.tls[0].hosts[0] | string | `"regulator-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-regulator.role | string | `"regulator"` |  |
| resource-and-service-offer-catalog-regulator.did.host | string | `"http://zorro5g-identity-and-permissions-manager-regulator"` |  |
| resource-and-service-offer-catalog-regulator.did.port | string | `"8000"` |  |
| resource-and-service-offer-catalog-regulator.lcm.host | string | `"smart-contract-lifecycle-manager-regulator"` |  |
| resource-and-service-offer-catalog-regulator.lcm.port | string | `"8087"` |  |
| resource-and-service-offer-catalog-regulator.lcm.offerPath | string | `"/product-offer/"` |  |
| resource-and-service-offer-catalog-regulator.lcm.orderPath | string | `"/product_order/"` |  |
| resource-and-service-offer-catalog-regulator.lcm.issuePath | string | `"/spectoken/derivative/issue"` |  |
| resource-and-service-offer-catalog-regulator.lcm.slaPath | string | `"/api/v1/service-level-agreement/"` |  |
| resource-and-service-offer-catalog-regulator.lcm.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-regulator.srsd.host | string | `"zorro5g-smart-resource-and-service-discovery-regulator"` |  |
| resource-and-service-offer-catalog-regulator.srsd.port | string | `"5000"` |  |
| resource-and-service-offer-catalog-regulator.srsd.requestPath | string | `"/classifyOffer"` |  |
| resource-and-service-offer-catalog-regulator.srsd.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-regulator.hostname | string | `"resource-and-service-offer-catalog-regulator"` |  |
| gui-regulator.enabled | bool | `true` |  |
| gui-regulator.ingress.enabled | bool | `true` |  |
| gui-regulator.ingress.className | string | `"nginx"` |  |
| gui-regulator.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| gui-regulator.ingress.hosts[0].host | string | `"regulator-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-regulator.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| gui-regulator.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| gui-regulator.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| gui-regulator.ingress.tls[0].hosts[0] | string | `"regulator-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-regulator.role | string | `"regulator"` |  |
| gui-regulator.marketPlaceUrl | string | `"https://regulator-rsoc.${HOSTED_ZONE_NAME}/tmf-api"` |  |
| gui-regulator.legalProseUrl | string | `"https://regulator-lpr.${HOSTED_ZONE_NAME}"` |  |
| gui-regulator.governanceUrl | string | `"https://regulator-gm.${HOSTED_ZONE_NAME}"` |  |
| gui-regulator.identityPermissionsUrl | string | `"https://regulator-idp.${HOSTED_ZONE_NAME}"` |  |
| gui-regulator.smartContractUrl | string | `"https://regulator-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/"` |  |
| gui-regulator.resourceManagerEndpoint | string | `"http://172.28.3.15:31081"` |  |
| gui-regulator.resourceManagerDiscoveryApiKey | string | `"ce0b0017-843c-4811-bb76-1005733cf3ec"` |  |
| gui-regulator.resourceManagerTraslatorApiKey | string | `"fe6d588b-1d6b-4954-9e26-a334d0d09eed"` |  |
| gui-regulator.rappDiscoveryApiKey | string | `"fc7def3f-0490-4c17-931f-6f6e4c759890"` |  |
| gui-regulator.sliceDiscoveryApiKey | string | `"685be7dc-6ed3-46de-90da-bc21747568a1"` |  |
| gui-regulator.ledgerIdentity | string | `"O=Regulator,L=New York,C=US"` |  |
| gui-regulator.srsdUrl | string | `"https://regulator-srsd.${HOSTED_ZONE_NAME}"` |  |
| gui-regulator.issmUrl | string | `"https://regulator-issm.${HOSTED_ZONE_NAME}"` |  |
| gui-regulator.rappUrl | string | `"http://172.28.3.242:2626"` |  |
| smart-resource-and-service-discovery-regulator.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-regulator.ingress.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-regulator.ingress.className | string | `"nginx"` |  |
| smart-resource-and-service-discovery-regulator.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-resource-and-service-discovery-regulator.ingress.hosts[0].host | string | `"regulator-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-regulator.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-resource-and-service-discovery-regulator.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-resource-and-service-discovery-regulator.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-resource-and-service-discovery-regulator.ingress.tls[0].hosts[0] | string | `"regulator-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-regulator.mongo.uri | string | `"mongodb-regulator-admin-srsd"` |  |
| monitoring-data-aggregator-regulator.enabled | bool | `true` |  |
| monitoring-data-aggregator-regulator.postgres.host | string | `"zorro5g-psqldb-regulator"` |  |
| monitoring-data-aggregator-regulator.postgres.port | int | `5432` |  |
| monitoring-data-aggregator-regulator.postgres.name | string | `"mdaregulator"` |  |
| monitoring-data-aggregator-regulator.postgres.existingSecret | string | `"mdaregulator.zorro5g-psqldb-regulator.credentials.postgresql.acid.zalan.do"` |  |
| monitoring-data-aggregator-regulator.postgres.userKey | string | `"username"` |  |
| monitoring-data-aggregator-regulator.postgres.passwordKey | string | `"password"` |  |
| monitoring-data-aggregator-regulator.ingress.enabled | bool | `false` |  |
| monitoring-data-aggregator-regulator.role | string | `"regulator"` |  |
| monitoring-data-aggregator-regulator.kafka.host | string | `"kafka-cluster-kafka-bootstrap"` |  |
| monitoring-data-aggregator-regulator.kafka.port | int | `9092` |  |
| xrm-regulator.role | string | `"regulator"` |  |
| xrm-regulator.catalogueapp.postgres.host | string | `"zorro5g-psqldb-regulator"` |  |
| xrm-regulator.catalogueapp.postgres.port | int | `5432` |  |
| xrm-regulator.catalogueapp.postgres.name | string | `"xrmcatalogueappregulator"` |  |
| xrm-regulator.catalogueapp.postgres.existingSecret | string | `"xrmcatalogueappregulator.zorro5g-psqldb-regulator.credentials.postgresql.acid.zalan.do"` |  |
| xrm-regulator.catalogueapp.postgres.userKey | string | `"username"` |  |
| xrm-regulator.catalogueapp.postgres.passwordKey | string | `"password"` |  |
| xrm-regulator.catalogueapp.mano.id | string | `"ZORRO_OSMR10"` |  |
| xrm-regulator.catalogueapp.mano.type | string | `"OSMR10"` |  |
| xrm-regulator.catalogueapp.mano.site | string | `"ZORRO_OSM"` |  |
| xrm-regulator.catalogueapp.mano.ip | string | `"osm.${HOSTED_ZONE_NAME}"` |  |
| xrm-regulator.catalogueapp.mano.port | string | `"80"` |  |
| xrm-regulator.catalogueapp.mano.username | string | `"admin"` |  |
| xrm-regulator.catalogueapp.mano.password | string | `"admin"` |  |
| xrm-regulator.catalogueapp.mano.project | string | `"regulator"` |  |
| xrm-regulator.catalogueapp.catalogue.id | string | `"DEFAULT_CAT"` |  |
| xrm-regulator.catalogueapp.catalogue.url | string | `"http://zorro5g-resource-and-service-offer-catalog-regulator:8080"` |  |
| xrm-regulator.catalogueui.keycloak.enabled | bool | `false` |  |
| xrm-regulator.catalogueui.catalogue.port | string | `"80"` |  |
| xrm-regulator.catalogueui.catalogue.scope | string | `"PUBLIC"` |  |
| xrm-regulator.kafka.host | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| xrm-regulator.gateway.mongo.uri | string | `"mongodb-regulator-admin-xrm-regulator"` |  |
| xrm-regulator.managementapi.mongo.uri | string | `"mongodb-regulator-admin-xrm-regulator"` |  |
| xrm-regulator.translator.postgres.host | string | `"zorro5g-psqldb-regulator"` |  |
| xrm-regulator.translator.postgres.port | int | `5432` |  |
| xrm-regulator.translator.postgres.name | string | `"xrmtranslatorregulator"` |  |
| xrm-regulator.translator.postgres.existingSecret | string | `"xrmtranslatorregulator.zorro5g-psqldb-regulator.credentials.postgresql.acid.zalan.do"` |  |
| xrm-regulator.translator.postgres.userKey | string | `"username"` |  |
| xrm-regulator.translator.postgres.passwordKey | string | `"password"` |  |
| elma-trader.enabled | bool | `true` |  |
| elma-trader.role | string | `"trader"` |  |
| elma-trader.domainId | string | `"trader"` |  |
| elma-trader.catalog.url | string | `"zorro5g-resource-and-service-offer-catalog-trader"` |  |
| elma-trader.catalog.port | string | `"8080"` |  |
| elma-trader.catalog.resources | string | `"None"` |  |
| elma-trader.netSlice.url | string | `"172.28.3.15"` |  |
| elma-trader.netSlice.port | string | `"31082"` |  |
| elma-trader.netSlice.endpoint | string | `"portal/elicensing/"` |  |
| elma-trader.datalake.url | string | `"http://zorro5g-datalake:8080/datalake/v1/catalog/instance/{instance_id}"` |  |
| elma-trader.datalake.auth | string | `"{\"userInfo\": {\"userId\": \"operator-c\", \"authToken\": \"blah\"}}"` |  |
| elma-trader.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| elma-trader.image.tag | string | `"latest"` |  |
| elma-trader.image.app | string | `"elma"` |  |
| elma-trader.image.image | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro/elma"` |  |
| elma-trader.image.pullPolicy | string | `"Always"` |  |
| elma-trader.image.pullSecrets | string | `"registry-credentials"` |  |
| elma-trader.rabbitmq.url | string | `"rabbitmq-elma-trader"` |  |
| elma-trader.rabbitmq.existingSecret | string | `"rabbitmq-elma-trader-default-user"` |  |
| elma-trader.rabbitmq.userKey | string | `"username"` |  |
| elma-trader.rabbitmq.passwordKey | string | `"password"` |  |
| aries-cloudagent-trader.enable | bool | `true` |  |
| aries-cloudagent-trader.agent.role | string | `"trader"` |  |
| aries-cloudagent-trader.agent.label | string | `"AgentHolder"` |  |
| aries-cloudagent-trader.agent.seed | string | `"AgentHolder000000000000000000000"` |  |
| aries-cloudagent-trader.agent.did | string | `"5YhRzG3iwWi195vHuxMJPy"` |  |
| aries-cloudagent-trader.agent.walletName | string | `"AgentHolder"` |  |
| aries-cloudagent-trader.agent.walletKey | string | `"AgentHolderKey"` |  |
| aries-cloudagent-trader.vonUrl | string | `"http://10.241.0.10:9000"` |  |
| aries-cloudagent-trader.persistence.enabled | bool | `false` |  |
| aries-cloudagent-trader.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| aries-cloudagent-trader.persistence.size | string | `"10Gi"` |  |
| identity-and-permissions-manager-trader.enabled | bool | `true` |  |
| identity-and-permissions-manager-trader.database.connectionString | string | `"mongodb-trader-admin-idp-trader"` |  |
| identity-and-permissions-manager-trader.database.port | string | `""` |  |
| identity-and-permissions-manager-trader.ingress.enabled | bool | `true` |  |
| identity-and-permissions-manager-trader.ingress.className | string | `"nginx"` |  |
| identity-and-permissions-manager-trader.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| identity-and-permissions-manager-trader.ingress.hosts[0].host | string | `"trader-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-trader.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| identity-and-permissions-manager-trader.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| identity-and-permissions-manager-trader.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| identity-and-permissions-manager-trader.ingress.tls[0].hosts[0] | string | `"trader-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-trader.idp.role | string | `"trader"` |  |
| identity-and-permissions-manager-trader.idp.whitelist | string | `"[\"*\"]"` |  |
| identity-and-permissions-manager-trader.idp.holderAgent | string | `"http://zorro5g-aries-cloudagent-trader:8001"` |  |
| identity-and-permissions-manager-trader.idp.issuerAgentUrl | string | `"http://zorro5g-aries-cloudagent-trader:8001"` |  |
| identity-and-permissions-manager-trader.idp.tradingProviderAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-trader:8000"` |  |
| identity-and-permissions-manager-trader.idp.adminAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` |  |
| identity-and-permissions-manager-trader.idp.regulatorAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` |  |
| identity-and-permissions-manager-trader.idp.otherIdpControllers | string | `"[\"http://zorro5g-identity-and-permissions-manager-regulator:8000\", \"http://zorro5g-identity-and-permissions-manager-admin:8000\", \"http://zorro5g-identity-and-permissions-manager-consumer:8000\" ]"` |  |
| identity-and-permissions-manager-trader.idp.key | string | `""` |  |
| identity-and-permissions-manager-trader.idp.vpnaasKey | string | `""` |  |
| smart-contract-lifecycle-manager-trader.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-trader.postgres.host | string | `"zorro5g-psqldb-trader"` |  |
| smart-contract-lifecycle-manager-trader.postgres.port | int | `5432` |  |
| smart-contract-lifecycle-manager-trader.postgres.name | string | `"sclmtrader"` |  |
| smart-contract-lifecycle-manager-trader.postgres.existingSecret | string | `"sclmtrader.zorro5g-psqldb-trader.credentials.postgresql.acid.zalan.do"` |  |
| smart-contract-lifecycle-manager-trader.postgres.userKey | string | `"username"` |  |
| smart-contract-lifecycle-manager-trader.postgres.passwordKey | string | `"password"` |  |
| smart-contract-lifecycle-manager-trader.ingress.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-trader.ingress.className | string | `"nginx"` |  |
| smart-contract-lifecycle-manager-trader.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-contract-lifecycle-manager-trader.ingress.hosts[0].host | string | `"trader-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-trader.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-contract-lifecycle-manager-trader.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-contract-lifecycle-manager-trader.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-contract-lifecycle-manager-trader.ingress.tls[0].hosts[0] | string | `"trader-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-trader.role | string | `"trader"` |  |
| smart-contract-lifecycle-manager-trader.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-trader:8000"` |  |
| smart-contract-lifecycle-manager-trader.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-trader:8080/api/v1"` |  |
| smart-contract-lifecycle-manager-trader.callbacks.updateSlaIdentity | string | `"https://trader-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/service-level-agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-trader.callbacks.updateAgreementIdentity | string | `"https://trader-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-trader.corda.username | string | `"user1"` |  |
| smart-contract-lifecycle-manager-trader.corda.password | string | `"test"` |  |
| smart-contract-lifecycle-manager-trader.corda.host | string | `"10.241.0.10"` |  |
| smart-contract-lifecycle-manager-trader.corda.port | string | `"10009"` |  |
| smart-contract-lifecycle-manager-trader.operatorName | string | `"operatorb"` |  |
| smart-contract-lifecycle-manager-trader.hostname | string | `"smart-contract-lifecycle-manager-trader:8087"` |  |
| resource-and-service-offer-catalog-trader.enable | bool | `true` |  |
| resource-and-service-offer-catalog-trader.operatorName | string | `"operatorb"` |  |
| resource-and-service-offer-catalog-trader.postgres.host | string | `"zorro5g-psqldb-trader"` |  |
| resource-and-service-offer-catalog-trader.postgres.port | int | `5432` |  |
| resource-and-service-offer-catalog-trader.postgres.name | string | `"rsoctrader"` |  |
| resource-and-service-offer-catalog-trader.postgres.existingSecret | string | `"rsoctrader.zorro5g-psqldb-trader.credentials.postgresql.acid.zalan.do"` |  |
| resource-and-service-offer-catalog-trader.postgres.userKey | string | `"username"` |  |
| resource-and-service-offer-catalog-trader.postgres.passwordKey | string | `"password"` |  |
| resource-and-service-offer-catalog-trader.kafka.bootstrap | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| resource-and-service-offer-catalog-trader.kafka.offeringsTopic | string | `"dlt-product-offerings"` |  |
| resource-and-service-offer-catalog-trader.kafka.ordersTopic | string | `"dlt-product-orders"` |  |
| resource-and-service-offer-catalog-trader.ingress.enabled | bool | `true` |  |
| resource-and-service-offer-catalog-trader.ingress.className | string | `"nginx"` |  |
| resource-and-service-offer-catalog-trader.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| resource-and-service-offer-catalog-trader.ingress.hosts[0].host | string | `"trader-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-trader.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| resource-and-service-offer-catalog-trader.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| resource-and-service-offer-catalog-trader.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| resource-and-service-offer-catalog-trader.ingress.tls[0].hosts[0] | string | `"trader-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-trader.role | string | `"trader"` |  |
| resource-and-service-offer-catalog-trader.did.host | string | `"http://zorro5g-identity-and-permissions-manager-trader"` |  |
| resource-and-service-offer-catalog-trader.did.port | string | `"8000"` |  |
| resource-and-service-offer-catalog-trader.lcm.host | string | `"smart-contract-lifecycle-manager-trader"` |  |
| resource-and-service-offer-catalog-trader.lcm.port | string | `"8087"` |  |
| resource-and-service-offer-catalog-trader.lcm.offerPath | string | `"/product-offer/"` |  |
| resource-and-service-offer-catalog-trader.lcm.orderPath | string | `"/product_order/"` |  |
| resource-and-service-offer-catalog-trader.lcm.issuePath | string | `"/spectoken/derivative/issue"` |  |
| resource-and-service-offer-catalog-trader.lcm.slaPath | string | `"/api/v1/service-level-agreement/"` |  |
| resource-and-service-offer-catalog-trader.lcm.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-trader.srsd.host | string | `"zorro5g-smart-resource-and-service-discovery-trader"` |  |
| resource-and-service-offer-catalog-trader.srsd.port | string | `"5000"` |  |
| resource-and-service-offer-catalog-trader.srsd.requestPath | string | `"/classifyOffer"` |  |
| resource-and-service-offer-catalog-trader.srsd.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-trader.hostname | string | `"resource-and-service-offer-catalog-trader"` |  |
| gui-trader.enabled | bool | `true` |  |
| gui-trader.ingress.enabled | bool | `true` |  |
| gui-trader.ingress.className | string | `"nginx"` |  |
| gui-trader.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| gui-trader.ingress.hosts[0].host | string | `"trader-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-trader.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| gui-trader.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| gui-trader.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| gui-trader.ingress.tls[0].hosts[0] | string | `"trader-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-trader.role | string | `"trader"` |  |
| gui-trader.marketPlaceUrl | string | `"https://trader-rsoc.${HOSTED_ZONE_NAME}/tmf-api"` |  |
| gui-trader.legalProseUrl | string | `"https://trader-lpr.${HOSTED_ZONE_NAME}"` |  |
| gui-trader.governanceUrl | string | `"https://trader-gm.${HOSTED_ZONE_NAME}"` |  |
| gui-trader.identityPermissionsUrl | string | `"https://trader-idp.${HOSTED_ZONE_NAME}"` |  |
| gui-trader.smartContractUrl | string | `"https://trader-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/"` |  |
| gui-trader.resourceManagerEndpoint | string | `"http://172.28.3.15:31081"` |  |
| gui-trader.resourceManagerDiscoveryApiKey | string | `"ce0b0017-843c-4811-bb76-1005733cf3ec"` |  |
| gui-trader.resourceManagerTraslatorApiKey | string | `"fe6d588b-1d6b-4954-9e26-a334d0d09eed"` |  |
| gui-trader.rappDiscoveryApiKey | string | `"fc7def3f-0490-4c17-931f-6f6e4c759890"` |  |
| gui-trader.sliceDiscoveryApiKey | string | `"685be7dc-6ed3-46de-90da-bc21747568a1"` |  |
| gui-trader.ledgerIdentity | string | `"CN=OperatorC,OU=DLT,O=DLT2,L=London,C=GB"` |  |
| gui-trader.srsdUrl | string | `"https://trader-srsd.${HOSTED_ZONE_NAME}"` |  |
| gui-trader.issmUrl | string | `"https://trader-issm.${HOSTED_ZONE_NAME}"` |  |
| gui-trader.rappUrl | string | `"http://172.28.3.242:2626"` |  |
| smart-resource-and-service-discovery-trader.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-trader.ingress.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-trader.ingress.className | string | `"nginx"` |  |
| smart-resource-and-service-discovery-trader.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-resource-and-service-discovery-trader.ingress.hosts[0].host | string | `"trader-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-trader.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-resource-and-service-discovery-trader.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-resource-and-service-discovery-trader.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-resource-and-service-discovery-trader.ingress.tls[0].hosts[0] | string | `"trader-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-trader.mongo.uri | string | `"mongodb-trader-admin-srsd"` |  |
| monitoring-data-aggregator-trader.enabled | bool | `true` |  |
| monitoring-data-aggregator-trader.postgres.host | string | `"zorro5g-psqldb-trader"` |  |
| monitoring-data-aggregator-trader.postgres.port | int | `5432` |  |
| monitoring-data-aggregator-trader.postgres.name | string | `"mdatrader"` |  |
| monitoring-data-aggregator-trader.postgres.existingSecret | string | `"mdatrader.zorro5g-psqldb-trader.credentials.postgresql.acid.zalan.do"` |  |
| monitoring-data-aggregator-trader.postgres.userKey | string | `"username"` |  |
| monitoring-data-aggregator-trader.postgres.passwordKey | string | `"password"` |  |
| monitoring-data-aggregator-trader.ingress.enabled | bool | `false` |  |
| monitoring-data-aggregator-trader.role | string | `"trader"` |  |
| monitoring-data-aggregator-trader.kafka.host | string | `"kafka-cluster-kafka-bootstrap"` |  |
| monitoring-data-aggregator-trader.kafka.port | int | `9092` |  |
| xrm-trader.role | string | `"trader"` |  |
| xrm-trader.catalogueapp.postgres.host | string | `"zorro5g-psqldb-trader"` |  |
| xrm-trader.catalogueapp.postgres.port | int | `5432` |  |
| xrm-trader.catalogueapp.postgres.name | string | `"xrmcatalogueapptrader"` |  |
| xrm-trader.catalogueapp.postgres.existingSecret | string | `"xrmcatalogueapptrader.zorro5g-psqldb-trader.credentials.postgresql.acid.zalan.do"` |  |
| xrm-trader.catalogueapp.postgres.userKey | string | `"username"` |  |
| xrm-trader.catalogueapp.postgres.passwordKey | string | `"password"` |  |
| xrm-trader.catalogueapp.mano.id | string | `"ZORRO_OSMR10"` |  |
| xrm-trader.catalogueapp.mano.type | string | `"OSMR10"` |  |
| xrm-trader.catalogueapp.mano.site | string | `"ZORRO_OSM"` |  |
| xrm-trader.catalogueapp.mano.ip | string | `"osm.${HOSTED_ZONE_NAME}"` |  |
| xrm-trader.catalogueapp.mano.port | string | `"80"` |  |
| xrm-trader.catalogueapp.mano.username | string | `"admin"` |  |
| xrm-trader.catalogueapp.mano.password | string | `"admin"` |  |
| xrm-trader.catalogueapp.mano.project | string | `"trader"` |  |
| xrm-trader.catalogueapp.catalogue.id | string | `"DEFAULT_CAT"` |  |
| xrm-trader.catalogueapp.catalogue.url | string | `"http://zorro5g-resource-and-service-offer-catalog-trader:8080"` |  |
| xrm-trader.catalogueui.keycloak.enabled | bool | `false` |  |
| xrm-trader.catalogueui.catalogue.port | string | `"80"` |  |
| xrm-trader.catalogueui.catalogue.scope | string | `"PUBLIC"` |  |
| xrm-trader.kafka.host | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| xrm-trader.gateway.mongo.uri | string | `"mongodb-trader-admin-xrm-trader"` |  |
| xrm-trader.managementapi.mongo.uri | string | `"mongodb-trader-admin-xrm-trader"` |  |
| xrm-trader.translator.postgres.host | string | `"zorro5g-psqldb-xrm-trader"` |  |
| xrm-trader.translator.postgres.port | int | `5432` |  |
| xrm-trader.translator.postgres.name | string | `"xrmtranslatortrader"` |  |
| xrm-trader.translator.postgres.existingSecret | string | `"xrmtranslatortrader.zorro5g-psqldb-trader.credentials.postgresql.acid.zalan.do"` |  |
| xrm-trader.translator.postgres.userKey | string | `"username"` |  |
| xrm-trader.translator.postgres.passwordKey | string | `"password"` |  |
| nsso-trader.enabled | bool | `true` |  |
| nsso-trader.role | string | `"trader"` |  |
| nsso-trader.postgres.url | string | `"jdbc:postgresql://zorro5g-psqldb-trader:5432/nssotrader?sslmode=require"` |  |
| nsso-trader.postgres.existingSecret | string | `"nssotrader.zorro5g-psqldb-trader.credentials.postgresql.acid.zalan.do"` |  |
| nsso-trader.postgres.userKey | string | `"username"` |  |
| nsso-trader.postgres.passwordKey | string | `"password"` |  |
| nsso-trader.nfvo.catalogue.type | string | `"OSM10"` |  |
| nsso-trader.nfvo.catalogue.address | string | `"http://osm.${HOSTED_ZONE_NAME}"` |  |
| nsso-trader.nfvo.lcm.type | string | `"OSM10"` |  |
| nsso-trader.nfvo.lcm.address | string | `"http://osm.${HOSTED_ZONE_NAME}"` |  |
| nsso-trader.nfvo.lcm.project | string | `"admin"` |  |
| nsso-trader.nfvo.lcm.username | string | `"admin"` |  |
| nsso-trader.nfvo.lcm.password | string | `"admin"` |  |
| nsso-trader.rabbitmq.host | string | `"zorro5g-nsso-trader-rabbitmq"` |  |
| trmf-trader.enabled | bool | `true` |  |
| trmf-trader.role | string | `"trader"` |  |
| trmf-trader.trmfdb.persistence.storageClassName | string | `"default"` |  |
| trmf-trader.trmfdb.persistence.size | string | `"8Gi"` |  |
| trmf-trader.catalogue.uri | string | `"http://zorro5g-resource-and-service-offer-catalog-trader:8080/tmf-api/"` |  |
| trmf-trader.elk.uri | string | `"http://zorro5g-xrm-trader-elasticsearch:9200/"` |  |
| trmf-trader.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| issm-trader.enabled | bool | `true` |  |
| issm-trader.role | string | `"trader"` |  |
| issm-trader.orchestrator | string | `"nsso"` |  |
| issm-trader.operatorName | string | `"operatorc"` |  |
| issm-trader.kafka.url | string | `"kafka-cluster-kafka-bootstrap.default.svc.cluster.local"` |  |
| issm-trader.kafka.port | string | `"9092"` |  |
| issm-trader.ingress.enabled | bool | `true` |  |
| issm-trader.ingress.className | string | `"nginx"` |  |
| issm-trader.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| issm-trader.ingress.hosts[0].host | string | `"trader-issm.${HOSTED_ZONE_NAME}"` |  |
| issm-trader.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| issm-trader.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| issm-trader.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| issm-trader.ingress.tls[0].hosts[0] | string | `"trader-issm.${HOSTED_ZONE_NAME}"` |  |
| issm-trader.argo.internal | string | `"zorro5g-argo-workflows-server.default.svc.cluster.local:2746"` |  |
| issm-trader.argo.external | string | `"https://argo.${HOSTED_ZONE_NAME}"` |  |
| elma-consumer.enabled | bool | `true` |  |
| elma-consumer.role | string | `"consumer"` |  |
| elma-consumer.domainId | string | `"consumer"` |  |
| elma-consumer.catalog.url | string | `"zorro5g-resource-and-service-offer-catalog-consumer"` |  |
| elma-consumer.catalog.port | string | `"8080"` |  |
| elma-consumer.catalog.resources | string | `"None"` |  |
| elma-consumer.netSlice.url | string | `"172.28.3.15"` |  |
| elma-consumer.netSlice.port | string | `"31082"` |  |
| elma-consumer.netSlice.endpoint | string | `"portal/elicensing/"` |  |
| elma-consumer.datalake.url | string | `"http://zorro5g-datalake:8080/datalake/v1/catalog/instance/{instance_id}"` |  |
| elma-consumer.datalake.auth | string | `"{\"userInfo\": {\"userId\": \"operator-d\", \"authToken\": \"blah\"}}"` |  |
| elma-consumer.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| elma-consumer.image.tag | string | `"latest"` |  |
| elma-consumer.image.app | string | `"elma"` |  |
| elma-consumer.image.image | string | `"gitlab-registry.fbk.eu/kubernetes-deploy/5g-zorro/elma"` |  |
| elma-consumer.image.pullPolicy | string | `"Always"` |  |
| elma-consumer.image.pullSecrets | string | `"registry-credentials"` |  |
| elma-consumer.rabbitmq.url | string | `"rabbitmq-elma-consumer"` |  |
| elma-consumer.rabbitmq.existingSecret | string | `"rabbitmq-elma-consumer-default-user"` |  |
| elma-consumer.rabbitmq.userKey | string | `"username"` |  |
| elma-consumer.rabbitmq.passwordKey | string | `"password"` |  |
| aries-cloudagent-consumer.enable | bool | `true` |  |
| aries-cloudagent-consumer.agent.role | string | `"consumer"` |  |
| aries-cloudagent-consumer.agent.label | string | `"AgentVerifier"` |  |
| aries-cloudagent-consumer.agent.seed | string | `"AgentVerifier0000000000000000000"` |  |
| aries-cloudagent-consumer.agent.did | string | `"2ramRjDFUSwWnn4JJ5MDpC"` |  |
| aries-cloudagent-consumer.agent.walletName | string | `"AgentVerifier"` |  |
| aries-cloudagent-consumer.agent.walletKey | string | `"AgentVerifierKey"` |  |
| aries-cloudagent-consumer.vonUrl | string | `"http://10.241.0.10:9000"` |  |
| aries-cloudagent-consumer.persistence.enabled | bool | `false` |  |
| aries-cloudagent-consumer.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| aries-cloudagent-consumer.persistence.size | string | `"10Gi"` |  |
| identity-and-permissions-manager-consumer.enabled | bool | `true` |  |
| identity-and-permissions-manager-consumer.database.connectionString | string | `"mongodb-consumer-admin-idp-consumer"` |  |
| identity-and-permissions-manager-consumer.database.port | string | `""` |  |
| identity-and-permissions-manager-consumer.ingress.enabled | bool | `true` |  |
| identity-and-permissions-manager-consumer.ingress.className | string | `"nginx"` |  |
| identity-and-permissions-manager-consumer.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| identity-and-permissions-manager-consumer.ingress.hosts[0].host | string | `"consumer-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-consumer.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| identity-and-permissions-manager-consumer.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| identity-and-permissions-manager-consumer.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| identity-and-permissions-manager-consumer.ingress.tls[0].hosts[0] | string | `"consumer-idp.${HOSTED_ZONE_NAME}"` |  |
| identity-and-permissions-manager-consumer.idp.role | string | `"consumer"` |  |
| identity-and-permissions-manager-consumer.idp.whitelist | string | `"[\"*\"]"` |  |
| identity-and-permissions-manager-consumer.idp.holderAgent | string | `"http://zorro5g-aries-cloudagent-consumer:8001"` |  |
| identity-and-permissions-manager-consumer.idp.issuerAgentUrl | string | `"http://zorro5g-aries-cloudagent-consumer:8001"` |  |
| identity-and-permissions-manager-consumer.idp.tradingProviderAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-consumer:8000"` |  |
| identity-and-permissions-manager-consumer.idp.adminAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-admin:8000"` |  |
| identity-and-permissions-manager-consumer.idp.regulatorAgentControllerUrl | string | `"http://zorro5g-identity-and-permissions-manager-regulator:8000"` |  |
| identity-and-permissions-manager-consumer.idp.otherIdpControllers | string | `"[\"http://zorro5g-identity-and-permissions-manager-regulator:8000\", \"http://zorro5g-identity-and-permissions-manager-admin:8000\", \"http://zorro5g-identity-and-permissions-manager-consumer:8000\" ]"` |  |
| identity-and-permissions-manager-consumer.idp.key | string | `""` |  |
| identity-and-permissions-manager-consumer.idp.vpnaasKey | string | `""` |  |
| smart-contract-lifecycle-manager-consumer.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-consumer.postgres.host | string | `"zorro5g-psqldb-consumer"` |  |
| smart-contract-lifecycle-manager-consumer.postgres.port | int | `5432` |  |
| smart-contract-lifecycle-manager-consumer.postgres.name | string | `"sclmconsumer"` |  |
| smart-contract-lifecycle-manager-consumer.postgres.existingSecret | string | `"sclmconsumer.zorro5g-psqldb-consumer.credentials.postgresql.acid.zalan.do"` |  |
| smart-contract-lifecycle-manager-consumer.postgres.userKey | string | `"username"` |  |
| smart-contract-lifecycle-manager-consumer.postgres.passwordKey | string | `"password"` |  |
| smart-contract-lifecycle-manager-consumer.ingress.enabled | bool | `true` |  |
| smart-contract-lifecycle-manager-consumer.ingress.className | string | `"nginx"` |  |
| smart-contract-lifecycle-manager-consumer.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-contract-lifecycle-manager-consumer.ingress.hosts[0].host | string | `"consumer-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-consumer.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-contract-lifecycle-manager-consumer.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-contract-lifecycle-manager-consumer.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-contract-lifecycle-manager-consumer.ingress.tls[0].hosts[0] | string | `"consumer-sclm.${HOSTED_ZONE_NAME}"` |  |
| smart-contract-lifecycle-manager-consumer.role | string | `"consumer"` |  |
| smart-contract-lifecycle-manager-consumer.identityBaseUrl | string | `"http://zorro5g-identity-and-permissions-manager-consumer:8000"` |  |
| smart-contract-lifecycle-manager-consumer.governanceBaseUrl | string | `"http://zorro5g-governance-manager-api-consumer:8080/api/v1"` |  |
| smart-contract-lifecycle-manager-consumer.callbacks.updateSlaIdentity | string | `"https://consumer-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/service-level-agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-consumer.callbacks.updateAgreementIdentity | string | `"https://consumer-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/api/v1/agreement/%s/identity"` |  |
| smart-contract-lifecycle-manager-consumer.corda.username | string | `"user1"` |  |
| smart-contract-lifecycle-manager-consumer.corda.password | string | `"test"` |  |
| smart-contract-lifecycle-manager-consumer.corda.host | string | `"10.241.0.10"` |  |
| smart-contract-lifecycle-manager-consumer.corda.port | string | `"10006"` |  |
| smart-contract-lifecycle-manager-consumer.operatorName | string | `"operatorc"` |  |
| smart-contract-lifecycle-manager-consumer.hostname | string | `"smart-contract-lifecycle-manager-consumer:8087"` |  |
| resource-and-service-offer-catalog-consumer.enable | bool | `true` |  |
| resource-and-service-offer-catalog-consumer.operatorName | string | `"operatorc"` |  |
| resource-and-service-offer-catalog-consumer.postgres.host | string | `"zorro5g-psqldb-consumer"` |  |
| resource-and-service-offer-catalog-consumer.postgres.port | int | `5432` |  |
| resource-and-service-offer-catalog-consumer.postgres.name | string | `"rsocconsumer"` |  |
| resource-and-service-offer-catalog-consumer.postgres.existingSecret | string | `"rsocconsumer.zorro5g-psqldb-consumer.credentials.postgresql.acid.zalan.do"` |  |
| resource-and-service-offer-catalog-consumer.postgres.userKey | string | `"username"` |  |
| resource-and-service-offer-catalog-consumer.postgres.passwordKey | string | `"password"` |  |
| resource-and-service-offer-catalog-consumer.kafka.bootstrap | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| resource-and-service-offer-catalog-consumer.kafka.offeringsTopic | string | `"dlt-product-offerings"` |  |
| resource-and-service-offer-catalog-consumer.kafka.ordersTopic | string | `"dlt-product-orders"` |  |
| resource-and-service-offer-catalog-consumer.ingress.enabled | bool | `true` |  |
| resource-and-service-offer-catalog-consumer.ingress.className | string | `"nginx"` |  |
| resource-and-service-offer-catalog-consumer.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| resource-and-service-offer-catalog-consumer.ingress.hosts[0].host | string | `"consumer-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-consumer.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| resource-and-service-offer-catalog-consumer.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| resource-and-service-offer-catalog-consumer.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| resource-and-service-offer-catalog-consumer.ingress.tls[0].hosts[0] | string | `"consumer-rsoc.${HOSTED_ZONE_NAME}"` |  |
| resource-and-service-offer-catalog-consumer.role | string | `"consumer"` |  |
| resource-and-service-offer-catalog-consumer.did.host | string | `"http://zorro5g-identity-and-permissions-manager-consumer"` |  |
| resource-and-service-offer-catalog-consumer.did.port | string | `"8000"` |  |
| resource-and-service-offer-catalog-consumer.lcm.host | string | `"smart-contract-lifecycle-manager-consumer"` |  |
| resource-and-service-offer-catalog-consumer.lcm.port | string | `"8087"` |  |
| resource-and-service-offer-catalog-consumer.lcm.offerPath | string | `"/product-offer/"` |  |
| resource-and-service-offer-catalog-consumer.lcm.orderPath | string | `"/product_order/"` |  |
| resource-and-service-offer-catalog-consumer.lcm.issuePath | string | `"/spectoken/derivative/issue"` |  |
| resource-and-service-offer-catalog-consumer.lcm.slaPath | string | `"/api/v1/service-level-agreement/"` |  |
| resource-and-service-offer-catalog-consumer.lcm.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-consumer.srsd.host | string | `"zorro5g-smart-resource-and-service-discovery-consumer"` |  |
| resource-and-service-offer-catalog-consumer.srsd.port | string | `"5000"` |  |
| resource-and-service-offer-catalog-consumer.srsd.requestPath | string | `"/classifyOffer"` |  |
| resource-and-service-offer-catalog-consumer.srsd.skipPost | string | `"false"` |  |
| resource-and-service-offer-catalog-consumer.hostname | string | `"resource-and-service-offer-catalog-consumer"` |  |
| gui-consumer.enabled | bool | `true` |  |
| gui-consumer.ingress.enabled | bool | `true` |  |
| gui-consumer.ingress.className | string | `"nginx"` |  |
| gui-consumer.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| gui-consumer.ingress.hosts[0].host | string | `"consumer-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-consumer.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| gui-consumer.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| gui-consumer.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| gui-consumer.ingress.tls[0].hosts[0] | string | `"consumer-gui.${HOSTED_ZONE_NAME}"` |  |
| gui-consumer.role | string | `"consumer"` |  |
| gui-consumer.marketPlaceUrl | string | `"https://consumer-rsoc.${HOSTED_ZONE_NAME}/tmf-api"` |  |
| gui-consumer.legalProseUrl | string | `"https://consumer-lpr.${HOSTED_ZONE_NAME}"` |  |
| gui-consumer.governanceUrl | string | `"https://consumer-gm.${HOSTED_ZONE_NAME}"` |  |
| gui-consumer.identityPermissionsUrl | string | `"https://consumer-idp.${HOSTED_ZONE_NAME}"` |  |
| gui-consumer.smartContractUrl | string | `"https://consumer-sclm.${HOSTED_ZONE_NAME}/smart-contract-lifecycle-manager/"` |  |
| gui-consumer.resourceManagerEndpoint | string | `"http://172.28.3.15:31081"` |  |
| gui-consumer.resourceManagerDiscoveryApiKey | string | `"ce0b0017-843c-4811-bb76-1005733cf3ec"` |  |
| gui-consumer.resourceManagerTraslatorApiKey | string | `"fe6d588b-1d6b-4954-9e26-a334d0d09eed"` |  |
| gui-consumer.rappDiscoveryApiKey | string | `"fc7def3f-0490-4c17-931f-6f6e4c759890"` |  |
| gui-consumer.sliceDiscoveryApiKey | string | `"685be7dc-6ed3-46de-90da-bc21747568a1"` |  |
| gui-consumer.ledgerIdentity | string | `"CN=OperatorB,OU=DLT,O=DLT2,L=London,C=GB"` |  |
| gui-consumer.srsdUrl | string | `"https://consumer-srsd.${HOSTED_ZONE_NAME}"` |  |
| gui-consumer.issmUrl | string | `"https://consumer-issm.${HOSTED_ZONE_NAME}"` |  |
| gui-consumer.rappUrl | string | `"http://172.28.3.242:2626"` |  |
| smart-resource-and-service-discovery-consumer.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-consumer.ingress.enabled | bool | `true` |  |
| smart-resource-and-service-discovery-consumer.ingress.className | string | `"nginx"` |  |
| smart-resource-and-service-discovery-consumer.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| smart-resource-and-service-discovery-consumer.ingress.hosts[0].host | string | `"consumer-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-consumer.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| smart-resource-and-service-discovery-consumer.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| smart-resource-and-service-discovery-consumer.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| smart-resource-and-service-discovery-consumer.ingress.tls[0].hosts[0] | string | `"consumer-srsd.${HOSTED_ZONE_NAME}"` |  |
| smart-resource-and-service-discovery-consumer.mongo.uri | string | `"mongodb-consumer-admin-srsd"` |  |
| monitoring-data-aggregator-consumer.enabled | bool | `true` |  |
| monitoring-data-aggregator-consumer.postgres.host | string | `"zorro5g-psqldb-consumer"` |  |
| monitoring-data-aggregator-consumer.postgres.port | int | `5432` |  |
| monitoring-data-aggregator-consumer.postgres.name | string | `"mdaconsumer"` |  |
| monitoring-data-aggregator-consumer.postgres.existingSecret | string | `"mdaconsumer.zorro5g-psqldb-consumer.credentials.postgresql.acid.zalan.do"` |  |
| monitoring-data-aggregator-consumer.postgres.userKey | string | `"username"` |  |
| monitoring-data-aggregator-consumer.postgres.passwordKey | string | `"password"` |  |
| monitoring-data-aggregator-consumer.ingress.enabled | bool | `false` |  |
| monitoring-data-aggregator-consumer.role | string | `"consumer"` |  |
| monitoring-data-aggregator-consumer.kafka.host | string | `"kafka-cluster-kafka-bootstrap"` |  |
| monitoring-data-aggregator-consumer.kafka.port | int | `9092` |  |
| xrm-consumer.role | string | `"consumer"` |  |
| xrm-consumer.catalogueapp.postgres.host | string | `"zorro5g-psqldb-consumer"` |  |
| xrm-consumer.catalogueapp.postgres.port | int | `5432` |  |
| xrm-consumer.catalogueapp.postgres.name | string | `"xrmcatalogueappconsumer"` |  |
| xrm-consumer.catalogueapp.postgres.existingSecret | string | `"xrmcatalogueappconsumer.zorro5g-psqldb-consumer.credentials.postgresql.acid.zalan.do"` |  |
| xrm-consumer.catalogueapp.postgres.userKey | string | `"username"` |  |
| xrm-consumer.catalogueapp.postgres.passwordKey | string | `"password"` |  |
| xrm-consumer.catalogueapp.mano.id | string | `"ZORRO_OSMR10"` |  |
| xrm-consumer.catalogueapp.mano.type | string | `"OSMR10"` |  |
| xrm-consumer.catalogueapp.mano.site | string | `"ZORRO_OSM"` |  |
| xrm-consumer.catalogueapp.mano.ip | string | `"osm.${HOSTED_ZONE_NAME}"` |  |
| xrm-consumer.catalogueapp.mano.port | string | `"80"` |  |
| xrm-consumer.catalogueapp.mano.username | string | `"admin"` |  |
| xrm-consumer.catalogueapp.mano.password | string | `"admin"` |  |
| xrm-consumer.catalogueapp.mano.project | string | `"consumer"` |  |
| xrm-consumer.catalogueapp.catalogue.id | string | `"DEFAULT_CAT"` |  |
| xrm-consumer.catalogueapp.catalogue.url | string | `"http://zorro5g-resource-and-service-offer-catalog-consumer:8080"` |  |
| xrm-consumer.catalogueui.keycloak.enabled | bool | `false` |  |
| xrm-consumer.catalogueui.catalogue.port | string | `"80"` |  |
| xrm-consumer.catalogueui.catalogue.scope | string | `"PUBLIC"` |  |
| xrm-consumer.kafka.host | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |
| xrm-consumer.gateway.mongo.uri | string | `"mongodb-consumer-admin-xrm-consumer"` |  |
| xrm-consumer.managementapi.mongo.uri | string | `"mongodb-consumer-admin-xrm-consumer"` |  |
| xrm-consumer.translator.postgres.host | string | `"zorro5g-psqldb-consumer"` |  |
| xrm-consumer.translator.postgres.port | int | `5432` |  |
| xrm-consumer.translator.postgres.name | string | `"xrmtranslatorconsumer"` |  |
| xrm-consumer.translator.postgres.existingSecret | string | `"xrmtranslatorconsumer.zorro5g-psqldb-consumer.credentials.postgresql.acid.zalan.do"` |  |
| xrm-consumer.translator.postgres.userKey | string | `"username"` |  |
| xrm-consumer.translator.postgres.passwordKey | string | `"password"` |  |
| issm-consumer.enabled | bool | `true` |  |
| issm-consumer.role | string | `"consumer"` |  |
| issm-consumer.orchestrator | string | `"nsso"` |  |
| issm-consumer.operatorName | string | `"operatorb"` |  |
| issm-consumer.kafka.url | string | `"kafka-cluster-kafka-bootstrap.default.svc.cluster.local"` |  |
| issm-consumer.kafka.port | string | `"9092"` |  |
| issm-consumer.argo.internal | string | `"zorro5g-argo-workflows-server.default.svc.cluster.local:2746"` |  |
| issm-consumer.argo.external | string | `"https://argo.${HOSTED_ZONE_NAME}"` |  |
| issm-consumer.ingress.enabled | bool | `true` |  |
| issm-consumer.ingress.className | string | `"nginx"` |  |
| issm-consumer.ingress.annotations."helm.sh/resource-policy" | string | `"keep"` |  |
| issm-consumer.ingress.hosts[0].host | string | `"consumer-issm.${HOSTED_ZONE_NAME}"` |  |
| issm-consumer.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| issm-consumer.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| issm-consumer.ingress.tls[0].secretName | string | `"5gzorro-wildcard-cert"` |  |
| issm-consumer.ingress.tls[0].hosts[0] | string | `"consumer-issm.${HOSTED_ZONE_NAME}"` |  |
| trmf-consumer.enabled | bool | `true` |  |
| trmf-consumer.role | string | `"consumer"` |  |
| trmf-consumer.trmfdb.persistence.enabled | bool | `true` |  |
| trmf-consumer.trmfdb.persistence.storageClassName | string | `"default"` |  |
| trmf-consumer.trmfdb.persistence.size | string | `"8Gi"` |  |
| trmf-consumer.catalogue.uri | string | `"http://zorro5g-resource-and-service-offer-catalog-consumer:8080/tmf-api/"` |  |
| trmf-consumer.elk.uri | string | `"http://zorro5g-xrm-consumer-elasticsearch:9200/"` |  |
| trmf-consumer.datalake.kafka | string | `"kafka-cluster-kafka-bootstrap:9092"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
