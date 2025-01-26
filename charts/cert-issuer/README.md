# cert-issuer Helm Chart

The `cert-issuer` Helm chart is designed to simplify the management of certificate issuers in Kubernetes. This chart enables automated issuance and renewal of TLS certificates using cert-manager, supporting multiple environments such as AWS, GCP, Azure, and on-premises clusters.

---

## Features

- **Automated Certificate Issuance**: Utilizes cert-manager to streamline certificate issuance and renewal.
- **Multi-Cloud and Multi-Challenge Support**: Supports DNS challenges for AWS Route 53, Google Cloud DNS, Azure DNS, Cloudflare, and HTTP challenges across diverse environments.
- **Self-Signed Certificates**: Provides optional configuration for generating self-signed certificates.
- **Secure and Flexible Configuration**: Offers customizable options for secrets, namespaces, annotations, and more.
- **OCI-Compliant Distribution**: Charts are packaged and stored in the GitHub Container Registry for efficient deployment.
- **CA Support**: Enables the signing of certificates using a CA keypair stored in a Kubernetes Secret, supporting internal PKIs managed by cert-manager.

---

## Installation

### Prerequisites

- Kubernetes 1.10+.
- [cert-manager](https://artifacthub.io/packages/helm/cert-manager/cert-manager) installed in the cluster.
- Helm 3.8+ (supports OCI-compliant charts).

### Compatibility

This chart is compatible with cert-manager versions 1.5.x and later. It is tested with cert-manager up to version 1.16.x. Compatibility with earlier versions is not guaranteed.

### Pull and Install the Chart

OCI-compliant charts are stored in container registries like the GitHub Container Registry. To use them, you must first enable OCI support in Helm and authenticate (if necessary).

See the [Helm documentation](https://helm.sh/docs/topics/registries/) for details on enabling OCI support.

#### Pull the Chart
Replace `sixafter` and `<VERSION>` with the appropriate values:
```bash
helm pull oci://ghcr.io/sixafter/cert-issuer --version <VERSION>
```

#### Install the Chart
```bash
helm install cert-issuer ./cert-issuer --values values.yaml
```

Replace `values.yaml` with your custom configuration file as needed.

---

## Configuration

The chart is highly configurable via the `values.yaml` file. Below are some key configuration options:

### Global Settings

| Parameter            | Description                              | Default        |
|----------------------|------------------------------------------|----------------|
| `certManagerNamespace` | Namespace where cert-manager is installed | `cert-manager` |

### ACME Configuration

| Parameter                 | Description                                          | Default                                |
|---------------------------|------------------------------------------------------|----------------------------------------|
| `acme.enabled`            | Enable ACME-based ClusterIssuer                      | `true`                                 |
| `acme.email`              | Email for Let's Encrypt notifications                | `user@example.com`                     |
| `acme.server`             | ACME server URL                                      | `https://acme-v02.api.letsencrypt.org/directory` |
| `acme.privateKeySecretRef`| Secret name to store the ACME private key            | `letsencrypt-private-key`              |
| `acme.solvers`            | Configuration for DNS and HTTP challenges                     | See `values.yaml`                      |

### Self-Signed Configuration

| Parameter             | Description                                      | Default             |
|-----------------------|--------------------------------------------------|---------------------|
| `selfSigned.enabled`  | Enable self-signed ClusterIssuer                 | `false`             |

---

## Testing the Chart

Validate the chart syntax:
```bash
make lint
```

Render the chart templates locally:
```bash
helm template cert-issuer ./cert-issuer --values values.yaml
```

---

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](../../CONTRIBUTING.md) for details on how to get involved.

---

## License

This project is licensed under the [Apache 2.0 License](https://choosealicense.com/licenses/apache-2.0/). See [LICENSE](../../LICENSE) file.
