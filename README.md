# Deployments

![GitHub last commit](https://img.shields.io/github/last-commit/b52-unofficial/deployments)
![GitHub issues](https://img.shields.io/github/issues/b52-unofficial/deployments)

This repository is a versatile tool for automating deployment workflows using Docker and Kubernetes(EKS) for TX-hero projects.



## Features
**TL;DR**:
- Simplifies deployment processes for Docker and Kubernetes.
- Provides pre-configured templates for common deployment scenarios.
- Supports custom configuration and advanced deployment strategies.

### Helm list
- A helm chart for ethereum private network consists of geth & lighthouse
- A helm chart for nginx-ingress controller
- A helm chart for nginx

### EKS object
- node group interacts with Elastic Kubernetes Service
- storage class for Elastic Block Storage

### Kubernetes object 
- Backend server deployments
- Frontend server deployments
- mirror server deployments

## How to use

To get started with Deployments, follow these steps:

1. private mempool release

   ```shell
   ./scripts/create-secrets.sh

   cd charts/ethereum

   helm install ethereum-sentry . -f value.sentry.yaml \
   && helm install ethereum-private . -f value.private.yaml
   ```
2. nginx release 
