##############################################################################################
#  Copyright Accenture. All Rights Reserved.
#
#  SPDX-License-Identifier: Apache-2.0
##############################################################################################

---
# yaml-language-server: $schema=../../../../platforms/network-schema.json
# This is a sample configuration file for SupplyChain App on Single K8s Cluster.
# For multiple K8s clusters, there should be multiple configuration files.
network:
  # Network level configuration specifies the attributes required for each organization
  # to join an existing network.
  type: corda
  version: 4.7

  frontend: enabled   #Flag for frontend to enabled for nodes/peers

  #Environment section for Kubernetes setup
  env:
    type: "dev"              # tag for the environment. Important to run multiple flux on single cluster
    proxy: ambassador               # value has to be 'ambassador' as 'haproxy' has not been implemented for Corda
    ambassadorPorts:                # Any additional Ambassador ports can be given here, this is valid only if proxy='ambassador'
      portRange:              # For a range of ports 
        from: 15010 
        to: 15020
    # ports: 15020,15021      # For specific ports
    loadBalancerSourceRanges: '0.0.0.0/0' # (Optional) Default value is '0.0.0.0/0', this value can be changed to any other IP adres or list (comma-separated without spaces) of IP adresses, this is valid only if proxy='ambassador'
    retry_count: 20                 # Retry count for the checks
    external_dns: enabled           # Should be enabled if using external-dns for automatic route configuration
  
  # Docker registry details where images are stored. This will be used to create k8s secrets
  # Please ensure all required images are built and stored in this registry. 
  # Do not check-in docker_password.
  docker:
    url: "ghcr.io/hyperledger"
    username: {{ .Values.global.imageCredentials.username }}
    password: {{ .Values.global.imageCredentials.password }}
  
  # Remote connection information for doorman and networkmap (will be blank or removed for hosting organization)
  network_services:
    - service:
      type: doorman
      uri: "https://doorman.{{ .Values.cordaBevel.url_suffix }}"
      certificate: /home/bevel/platforms/r3-corda/configuration/build/corda/doorman/tls/ambassador.crt
    - service:
      type: networkmap
      uri: "https://networkmap.{{ .Values.cordaBevel.url_suffix }}"
      certificate: /home/bevel/platforms/r3-corda/configuration/build/corda/networkmap/tls/ambassador.crt
  
  # Allows specification of one or many organizations that will be connecting to a network.
  # If an organization is also hosting the root of the network (e.g. doorman, membership service, etc),
  # then these services should be listed in this section as well.
  organizations:
    # Specification for the 1st organization. Each organization maps to a VPC and a separate k8s cluster
    - organization:
      name: base
      country: UK
      state: London
      location: London
      subject: "CN=DLT Root CA,OU=DLT,O=DLT,L=London,C=GB"
      type: doorman-nms-notary
      external_url_suffix: {{ .Values.cordaBevel.url_suffix }}
  
      cloud_provider: azure   # Options: aws, azure, gcp
      aws:
        access_key: "aws_access_key"        # AWS Access key, only used when cloud_provider=aws
        secret_key: "aws_secret_key"        # AWS Secret key, only used when cloud_provider=aws
  
      # Kubernetes cluster deployment variables. The config file path and name has to be provided in case
      # the cluster has already been created.
      k8s:
        context: "5gzorro"
        config_file: "/home/bevel/build/config"

      # Hashicorp Vault server address and root-token. Vault should be unsealed.
      # Do not check-in root_token
      vault:
        url: {{ .Values.cordaBevel.vault.url }}
        root_token: {{ .Values.cordaBevel.vault.root_token }}
        
      # Git Repo details which will be used by GitOps/Flux.
      # Do not check-in git_access_token
      gitops:
        git_protocol: "https" # Option for git over https or ssh
        git_url: {{ .Values.cordaBevel.git.url }}        # Gitops https or ssh url for flux value files 
        branch: "develop"           # Git branch where release is being made
        release_dir: "platforms/r3-corda/releases/dev" # Relative Path in the Git repo for flux sync per environment. 
        chart_source: "platforms/r3-corda/charts"     # Relative Path where the Helm charts are stored in Git repo
        git_repo: {{ .Values.cordaBevel.git.repo_url }}   # Gitops git repository URL for git push 
        username: {{ .Values.cordaBevel.git.username }}          # Git Service user who has rights to check-in in all branches
        password: {{ .Values.cordaBevel.git.password }}          # Git Server user password/token (Optional for ssh; Required for https)
        email: {{ .Values.cordaBevel.git.email }}                # Email to use in git config
        private_key: "path_to_private_key"          # Path to private key file which has write-access to the git repo (Optional for https; Required for ssh)

      # Cordapps Repository details (optional if cordapps jar are store in a repository)
      cordapps:
        jars: 
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-supply-chain/4.9/cordapp-supply-chain-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-contracts-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-workflows-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/ci-workflows-1.0.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-contracts-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-selection-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-workflows-1.1.jar
        username: {{ .Values.cordaBevel.git.username }}
        password: {{ .Values.cordaBevel.git.password }}

      # Services maps to the pods that will be deployed on the k8s cluster
      # This sample has doorman, nms and notary on one cluster but different namespaces
      services:
        doorman:
          name: doorman
          subject: "CN=Corda Doorman CA,OU=DLT,O=DLT,L=Berlin,C=DE"
          db_subject: "/C=US/ST=California/L=San Francisco/O=My Company Ltd/OU=DBA/CN=mongoDB"
          type: doorman
          ports:
            servicePort: 8080
            targetPort: 8080
          tls: "on"                      # off/on based on TLS mode off/on for doorman
        nms:
          name: networkmap
          subject: "CN=Network Map,OU=FRA,O=FRA,L=Berlin,C=DE"
          db_subject: "/C=US/ST=California/L=San Francisco/O=My Company Ltd/OU=DBA/CN=mongoDB"
          type: networkmap
          ports:
            servicePort: 8080
            targetPort: 8080
          tls: "on"                       # off/on based on TLS mode off/on for nms
        # Currently only supporting a single notary cluster, but may want to expand in the future
        notary:
          name: notary
          subject: "O=Notary,OU=Notary,L=London,C=GB"
          serviceName: "O=Notary Service,OU=Notary,L=London,C=GB"
          validating: true            #true - if notary is validating, false  - if notary is non-validating
          type: notary            
          p2p:
            port: 10002
            targetPort: 10002
            ambassador: 15010       #Port for ambassador service (must be from env.ambassadorPorts above)
          rpc:
            port: 10003
            targetPort: 10003
          rpcadmin:
            port: 10005
            targetPort: 10005
          dbtcp:
            port: 9101
            targetPort: 1521
          dbweb:             
            port: 8080
            targetPort: 81        

    # Specification for the 2nd organization. Each organization maps to a VPC and a separate k8s cluster
    - organization:
      name: admin
      country: CH
      state: Zurich
      location: Zurich
      subject: "O=Admin,OU=Admin,L=Zurich,C=CH"
      type: node
      external_url_suffix: {{ .Values.cordaBevel.url_suffix }}
      
      cloud_provider: azure   # Options: aws, azure, gcp
      aws:
        access_key: "aws_access_key"        # AWS Access key, only used when cloud_provider=aws
        secret_key: "aws_secret_key"        # AWS Secret key, only used when cloud_provider=aws
  
      # Kubernetes cluster deployment variables. The config file path and name has to be provided in case
      # the cluster has already been created.
      k8s:
        context: {{ .Values.cordaBevel.k8s.context }}
        config_file: "/home/bevel/build/config"

      # Hashicorp Vault server address and root-token. Vault should be unsealed.
      # Do not check-in root_token
      vault:
        url: {{ .Values.cordaBevel.vault.url }}
        root_token: {{ .Values.cordaBevel.vault.root_token }}
        
      # Git Repo details which will be used by GitOps/Flux.
      # Do not check-in git_access_token
      gitops:
        git_protocol: "https" # Option for git over https or ssh
        git_url: {{ .Values.cordaBevel.git.url }}         # Gitops https or ssh url for flux value files 
        branch: "develop"           # Git branch where release is being made
        release_dir: "platforms/r3-corda/releases/dev" # Relative Path in the Git repo for flux sync per environment. 
        chart_source: "platforms/r3-corda/charts"     # Relative Path where the Helm charts are stored in Git repo
        git_repo: {{ .Values.cordaBevel.git.repo_url }}   # Gitops git repository URL for git push 
        username: {{ .Values.cordaBevel.git.username }}          # Git Service user who has rights to check-in in all branches
        password: {{ .Values.cordaBevel.git.password }}          # Git Server user password/token (Optional for ssh; Required for https)
        email: {{ .Values.cordaBevel.git.email }}                # Email to use in git config
        private_key: "path_to_private_key"          # Path to private key file which has write-access to the git repo (Optional for https; Required for ssh)

      # Cordapps Repository details (optional if cordapps jar are store in a repository)
      cordapps:
        jars: 
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-supply-chain/4.9/cordapp-supply-chain-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-contracts-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-workflows-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/ci-workflows-1.0.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-contracts-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-selection-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-workflows-1.1.jar
        username: {{ .Values.cordaBevel.git.username }}
        password: {{ .Values.cordaBevel.git.password }}

      # The participating nodes are named as peers 
      services:
        peers:
        - peer:
          name: admin
          subject: "O=Admin,OU=Admin,L=47.38/8.54/Zurich,C=CH"  # This is the node identity. L=lat/long is mandatory for supplychain sample app
          type: node
          p2p:
            port: 10002
            targetPort: 10002
            ambassador: 15010       #Port for ambassador service (must be from env.ambassadorPorts above)
          rpc:
            port: 10003
            targetPort: 10003
          rpcadmin:
            port: 10005
            targetPort: 10005
          dbtcp:
            port: 9101
            targetPort: 1521
          dbweb:             
            port: 8080
            targetPort: 81
          springboot:             # This is for the springboot server
            targetPort: 20001
            port: 20001 
          expressapi:             # This is for the express api server
            targetPort: 3000
            port: 3000
        
    - organization:
      name: trader
      country: GB
      state: London
      location: London
      subject: "O=Trader,OU=Trader,L=London,C=GB"
      type: node
      external_url_suffix: {{ .Values.cordaBevel.url_suffix }}
      
      cloud_provider: azure   # Options: aws, azure, gcp
      aws:
        access_key: "aws_access_key"        # AWS Access key, only used when cloud_provider=aws
        secret_key: "aws_secret_key"        # AWS Secret key, only used when cloud_provider=aws
  
      # Kubernetes cluster deployment variables. The config file path and name has to be provided in case
      # the cluster has already been created.
      k8s:
        context: "5gzorro"
        config_file: "/home/bevel/build/config"

      # Hashicorp Vault server address and root-token. Vault should be unsealed.
      # Do not check-in root_token
      vault:
        url: {{ .Values.cordaBevel.vault.url }}
        root_token: {{ .Values.cordaBevel.vault.root_token }}
        
      # Git Repo details which will be used by GitOps/Flux.
      # Do not check-in git_access_token
      gitops:
        git_protocol: "https" # Option for git over https or ssh
        git_url: {{ .Values.cordaBevel.git.url }}         # Gitops https or ssh url for flux value files 
        branch: "develop"           # Git branch where release is being made
        release_dir: "platforms/r3-corda/releases/dev" # Relative Path in the Git repo for flux sync per environment. 
        chart_source: "platforms/r3-corda/charts"     # Relative Path where the Helm charts are stored in Git repo
        git_repo: {{ .Values.cordaBevel.git.repo_url }}   # Gitops git repository URL for git push 
        username: {{ .Values.cordaBevel.git.username }}          # Git Service user who has rights to check-in in all branches
        password: {{ .Values.cordaBevel.git.password }}          # Git Server user password/token (Optional for ssh; Required for https)
        email: {{ .Values.cordaBevel.git.email }}                # Email to use in git config
        private_key: "path_to_private_key"          # Path to private key file which has write-access to the git repo (Optional for https; Required for ssh)

      # Cordapps Repository details (optional if cordapps jar are store in a repository)
      cordapps:
        jars: 
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-supply-chain/4.9/cordapp-supply-chain-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-contracts-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-workflows-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/ci-workflows-1.0.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-contracts-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-selection-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-workflows-1.1.jar
        username: {{ .Values.cordaBevel.git.username }}
        password: {{ .Values.cordaBevel.git.password }}
      
      services:
        peers:
        - peer:
          name: trader
          subject: "O=Trader,OU=Trader,L=51.50/-0.13/London,C=GB" # This is the node subject. L=lat/long is mandatory for supplychain sample app
          type: node
          p2p:
            port: 10002
            targetPort: 10002
            ambassador: 15020       #Port for ambassador service (must be from env.ambassadorPorts above)
          rpc:
            port: 10003
            targetPort: 10003
          rpcadmin:
            port: 10005
            targetPort: 10005
          dbtcp:
            port: 9101
            targetPort: 1521
          dbweb:             
            port: 8080
            targetPort: 81
          springboot:
            targetPort: 20001
            port: 20001 
          expressapi:
            targetPort: 3000
            port: 3000

    - organization:
      name: consumer
      country: US
      state: New York
      location: New York
      subject: "O=Consumer,OU=Consumer,L=New York,C=US"
      type: node
      external_url_suffix: {{ .Values.cordaBevel.url_suffix }}
      
      cloud_provider: azure   # Options: aws, azure, gcp
      aws:
        access_key: "aws_access_key"        # AWS Access key, only used when cloud_provider=aws
        secret_key: "aws_secret_key"        # AWS Secret key, only used when cloud_provider=aws
  
      # Kubernetes cluster deployment variables. The config file path and name has to be provided in case
      # the cluster has already been created.
      k8s:
        context: "5gzorro"
        config_file: "/home/bevel/build/config"

      # Hashicorp Vault server address and root-token. Vault should be unsealed.
      # Do not check-in root_token
      vault:
        url: {{ .Values.cordaBevel.vault.url }}
        root_token: {{ .Values.cordaBevel.vault.root_token }}
        
      # Git Repo details which will be used by GitOps/Flux.
      # Do not check-in git_access_token
      gitops:
        git_protocol: "https" # Option for git over https or ssh
        git_url: {{ .Values.cordaBevel.git.url }}         # Gitops https or ssh url for flux value files 
        branch: "develop"           # Git branch where release is being made
        release_dir: "platforms/r3-corda/releases/dev" # Relative Path in the Git repo for flux sync per environment. 
        chart_source: "platforms/r3-corda/charts"     # Relative Path where the Helm charts are stored in Git repo
        git_repo: {{ .Values.cordaBevel.git.repo_url }}   # Gitops git repository URL for git push 
        username: {{ .Values.cordaBevel.git.username }}          # Git Service user who has rights to check-in in all branches
        password: {{ .Values.cordaBevel.git.password }}          # Git Server user password/token (Optional for ssh; Required for https)
        email: {{ .Values.cordaBevel.git.email }}                # Email to use in git config
        private_key: "path_to_private_key"          # Path to private key file which has write-access to the git repo (Optional for https; Required for ssh)

      # Cordapps Repository details (optional if cordapps jar are store in a repository)
      cordapps:
        jars: 
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-supply-chain/4.9/cordapp-supply-chain-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-contracts-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-workflows-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/ci-workflows-1.0.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-contracts-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-selection-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-workflows-1.1.jar
        username: {{ .Values.cordaBevel.git.username }}
        password: {{ .Values.cordaBevel.git.password }}

      services:
        peers:
        - peer:
          name: consumer
          subject: "O=Consumer,OU=Consumer,L=40.73/-74/New York,C=US" # This is the node identity. L=lat/long is mandatory for supplychain sample app
          type: node
          p2p:
            port: 10002
            targetPort: 10002
            ambassador: 15020       #Port for ambassador service (must be from env.ambassadorPorts above)
          rpc:
            port: 10003
            targetPort: 10003
          rpcadmin:
            port: 10005
            targetPort: 10005
          dbtcp:
            port: 9101
            targetPort: 1521
          dbweb:             
            port: 8080
            targetPort: 81
          springboot:
            targetPort: 20001
            port: 20001 
          expressapi:
            targetPort: 3000
            port: 3000


    - organization:
      name: regulator
      country: US
      state: Massachusetts
      location: Boston
      subject: "O=Regulator,OU=Regulator,L=Boston,C=US"
      type: node
      external_url_suffix: {{ .Values.cordaBevel.url_suffix }}
      
      cloud_provider: azure   # Options: aws, azure, gcp
      aws:
        access_key: "aws_access_key"        # AWS Access key, only used when cloud_provider=aws
        secret_key: "aws_secret_key"        # AWS Secret key, only used when cloud_provider=aws
  
      # Kubernetes cluster deployment variables. The config file path and name has to be provided in case
      # the cluster has already been created.
      k8s:
        context: "5gzorro"
        config_file: "/home/bevel/build/config"

      # Hashicorp Vault server address and root-token. Vault should be unsealed.
      # Do not check-in root_token
      vault:
        url: {{ .Values.cordaBevel.vault.url }}
        root_token: {{ .Values.cordaBevel.vault.root_token }}
        
      # Git Repo details which will be used by GitOps/Flux.
      # Do not check-in git_access_token
      gitops:
        git_protocol: "https" # Option for git over https or ssh
        git_url: {{ .Values.cordaBevel.git.url }}         # Gitops https or ssh url for flux value files 
        branch: "develop"           # Git branch where release is being made
        release_dir: "platforms/r3-corda/releases/dev" # Relative Path in the Git repo for flux sync per environment. 
        chart_source: "platforms/r3-corda/charts"     # Relative Path where the Helm charts are stored in Git repo
        git_repo: {{ .Values.cordaBevel.git.repo_url }}   # Gitops git repository URL for git push 
        username: {{ .Values.cordaBevel.git.username }}          # Git Service user who has rights to check-in in all branches
        password: {{ .Values.cordaBevel.git.password }}          # Git Server user password/token (Optional for ssh; Required for https)
        email: {{ .Values.cordaBevel.git.email }}                # Email to use in git config
        private_key: "path_to_private_key"          # Path to private key file which has write-access to the git repo (Optional for https; Required for ssh)

      # Cordapps Repository details (optional if cordapps jar are store in a repository)
      cordapps:
        jars: 
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-supply-chain/4.9/cordapp-supply-chain-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-contracts-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/5gzorro-workflows-0.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/ci-workflows-1.0.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-contracts-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-selection-1.1.jar
        - jar:
            # e.g https://maven.pkg.github.com/hyperledger/bevel/com.supplychain.bcc.cordapp-contracts-states/4.9/cordapp-contracts-states-4.9.jar
            url: https://raw.githubusercontent.com/5GZORRO/bevel/develop/cordapps/tokens-workflows-1.1.jar
        username: {{ .Values.cordaBevel.git.username }}
        password: {{ .Values.cordaBevel.git.password }}
        
      services:
        peers:
        - peer:
          name: regulator
          subject: "O=Regulator,OU=Regulator,L=42.36/-71.06/Boston,C=US"  # This is the node identity. L=lat/long is mandatory for supplychain sample app
          type: node
          p2p:
            port: 10002
            targetPort: 10002
            ambassador: 15020       #Port for ambassador service (must be from env.ambassadorPorts above)
          rpc:
            port: 10003
            targetPort: 10003
          rpcadmin:
            port: 10005
            targetPort: 10005
          dbtcp:
            port: 9101
            targetPort: 1521
          dbweb:             
            port: 8080
            targetPort: 81
          springboot:
            targetPort: 20001
            port: 20001 
          expressapi:
            targetPort: 3000
            port: 3000