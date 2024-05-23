# tibuzin

The tibuzin of dis-cyril alexa like.

## Installation

### Provisionning a local cluster

```bash
cd ./terraform/provisioning-local-cluster
terraform init
terraform apply
```

### Provisionning an OpenStack cluster

```bash
cd ./terraform/provisioning-os-cluster
terraform init
terraform apply
```

### Destroy the project

```bash
terraform destroy
```

## Deploy with Flux

To deploy, you need to install [Flux CLI](https://fluxcd.io/flux/get-started/).

```bash
flux bootstrap github \
  --owner=dis-cyril \
  --repository=tibuzin \
  --branch=main \
  --path=./infrastructure
```