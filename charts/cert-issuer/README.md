# cert-issuer Helm Chart

The `cert-issuer` Helm chart is designed to simplify the management of certificate issuers in Kubernetes. This chart enables automated issuance and renewal of TLS certificates using cert-manager, supporting multiple environments such as AWS, GCP, Azure, and on-premises clusters.

---

## Features

- **Automated Certificate Issuance**: Leverages cert-manager to handle certificate management.
- **Multi-Cloud Support**: Supports DNS challenges for AWS Route 53, Google Cloud DNS, Azure DNS, and Cloudflare.
- **Self-Signed Certificates**: Allows optional configuration for self-signed issuers.
- **Secure and Flexible**: Parameterized configurations for secrets, namespaces, and annotations.

---

## Installation

### Prerequisites

- Kubernetes 1.10+.
- cert-manager installed in the cluster.
- Helm 3.8+ (supports OCI-compliant charts).

### Pull and Install the Chart

OCI-compliant charts are stored in container registries like the GitHub Container Registry. To use them, you must first enable OCI support in Helm and authenticate (if necessary).

#### Enable OCI Support
```bash
export HELM_EXPERIMENTAL_OCI=1
```

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
| `acme.solvers`            | Configuration for DNS challenges                     | See `values.yaml`                      |

### Self-Signed Configuration

| Parameter             | Description                                      | Default             |
|-----------------------|--------------------------------------------------|---------------------|
| `selfSigned.enabled`  | Enable self-signed ClusterIssuer                 | `false`             |

### Example `values.yaml`

```yaml
# ACME Issuer Configuration
acme:
  # Enable or disable the creation of an ACME ClusterIssuer.
  # Set to true to create the ACME ClusterIssuer, or false to exclude it.
  enabled: true

  # The email address to use for the ACME account registration.
  # Required by Let's Encrypt for notifications about certificate expiration or updates.
  email: "user@example.com"

  # The ACME server URL.
  # Use the production endpoint for real certificates:
  #   https://acme-v02.api.letsencrypt.org/directory
  # Use the staging endpoint for testing (does not issue trusted certificates):
  #   https://acme-staging-v02.api.letsencrypt.org/directory
  server: "https://acme-staging-v02.api.letsencrypt.org/directory"

  # The name of the Kubernetes Secret where the ACME private key will be stored.
  privateKeySecretRef: "acme-private-key"

  # Private Key Management for the ACME Account
  privateKey:
    # Set to true to allow the Helm chart to create a Kubernetes Secret for the ACME private key.
    # If set to false, the Secret will either be automatically created and managed by cert-manager,
    # or an existing Secret must be provided in advance.
    create: false

  solvers:
    # Example configuration for DNS and other solver types.
    - selector:
        dnsZones:
          # List of DNS zones that this solver will handle.
          - "example.com"
      dns:
        dns01:
          route53:
            # AWS region where the Route 53 hosted zone is located.
            region: "us-east-1"
            # (Optional) Hosted Zone ID for the domain.
            hostedZoneID: "Z1234567890ABC"

# Self-Signed Issuer Configuration
selfSigned:
  # Enable or disable the creation of a self-signed ClusterIssuer.
  # Set to true to create the self-signed ClusterIssuer, or false to exclude it.
  enabled: true
```

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

