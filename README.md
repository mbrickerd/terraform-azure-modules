# terraform-azure-modules

This repository houses a collection of standardised, reusable Terraform modules for provisioning and managing Azure resources. These modules are designed to enforce best practices, simplify infrastructure deployment, and provide consistent configuration across multiple projects.

Each module abstracts away the complexity of Azure resource provisioning, offering a carefully designed interface that balances flexibility with standardisation. By using these modules, teams can accelerate development while maintaining compliance with organisational standards for security, tagging, naming conventions, and resource configuration.

## Benefits

- **Consistency**: Enforce standardised resource configurations across all projects
- **Maintainability**: Centralised module updates propagate improvements to all consuming projects
- **Efficiency**: Reduce boilerplate code and accelerate infrastructure deployment
- **Compliance**: Built-in best practices for security, resilience, and cost optimisation
- **Collaboration**: Shared modules create a common language for infrastructure development

## Getting Started

Modules can be referenced in your Terraform configurations using the standard module source syntax pointing to this repository.

## Prerequisites

The following tools are required to work with this repository:

- [**terraform**](https://www.terraform.io/) - Infrastructure as Code tool to provision and manage cloud resources
- [**terraform-docs**](https://terraform-docs.io/) - Generate documentation from Terraform modules
- [**tflint**](https://github.com/terraform-linters/tflint) - Terraform linter for detecting errors and enforcing best practices
- [**checkov**](https://www.checkov.io/2.Basics/Installing%20Checkov.html) - Static code analysis tool for infrastructure as code
- [**make**](https://www.gnu.org/software/make/manual/make.html) - Build automation tool (installed by default on most OS)
- [**pre-commit**](https://pre-commit.com/) - Framework for managing git pre-commit hooks

## Repository Structure

```
.
├── modules/                          // Directory containing all reusable Terraform modules
│   ├── app-registration/             // Azure AD application registration
│   ├── network-security-group/       // Network security group configuration
│   ├── network-watcher-flow-log/     // Network traffic flow logging
│   ├── resource-group/               // Azure resource group management
│   ├── storage-account/              // Azure storage account configuration
│   ├── storage-container/            // Blob containers within storage accounts
│   ├── subnet/                       // Subnet configuration within virtual networks
│   └── virtual-network/              // Virtual network configuration
├── CODEOWNERS                        // Defines owners for code reviews
├── Makefile                          // Contains commands for development workflow
├── README.md                         // Project documentation
└── checkov.yaml                      // Configuration for Checkov static code analysis
```

Each module follows a consistent structure:
- `data.tf` (when applicable) - Data sources
- `locals.tf` - Local values
- `main.tf` - Primary resource declarations
- `outputs.tf` - Output values
- `README.md` - Module documentation
- `variables.tf` - Input variables
- `versions.tf` - Required providers and versions

## Getting Started

### Module Usage

To use a module in your Terraform configuration:

```hcl
module "resource_group" {
  source = "git::https://github.com/yourusername/azure-terraform-modules.git//modules/resource-group?ref=abc123def456789ghijklmnopqrstuvwxyz0123"

  name     = "rg-example"
  location = "westeurope"
  tags     = {
    Environment = "Development"
    Project     = "Example"
  }
}
```

Always reference a specific commit SHA in the source URL when using modules in production. This is critical because:

1. **Immutability** - A commit SHA guarantees the exact code version will never change, unlike branches which can be updated
2. **Reproducibility** - Ensures identical infrastructure deployments across different environments and times
3. **Security** - Prevents supply chain attacks where module code could be maliciously altered
4. **Auditing** - Provides clear traceability for which exact module version was used in deployments

While tags like `v1.0.0` might seem convenient, they can be deleted or moved to point to different commits, making them less reliable than immutable commit SHAs for production infrastructure.

## Development

### Pre-commit Hooks

This repository uses pre-commit to run checks before committing changes. To install pre-commit hooks:

```bash
pre-commit install
```

To run pre-commit checks manually:

```bash
pre-commit run --all-files
```

### Make Commands

The repository includes a Makefile to simplify common development tasks:

#### Docs

Generate documentation for all modules:

```bash
make docs
```

#### Test

Run all validation tools (format, lint, validate, security checks):

```bash
make test
```

Individual commands are also available:

```bash
make fmt      # Format Terraform code
make lint     # Run tflint
make validate # Run terraform validate
make checkov  # Run security checks with Checkov
```

## Modules Documentation

| Module | Description |
|--------|-------------|
| [app-registration](./modules/app-registration/README.md) | Creates and manages Azure AD application registrations |
| [network-security-group](./modules/network-security-group/README.md) | Configures network security groups with rules |
| [network-watcher-flow-log](./modules/network-watcher-flow-log/README.md) | Sets up network traffic flow logging |
| [resource-group](./modules/resource-group/README.md) | Manages Azure resource groups |
| [storage-account](./modules/storage-account/README.md) | Creates and configures Azure storage accounts |
| [storage-container](./modules/storage-container/README.md) | Manages blob containers within storage accounts |
| [subnet](./modules/subnet/README.md) | Configures subnets within virtual networks |
| [virtual-network](./modules/virtual-network/README.md) | Creates and manages Azure virtual networks |

## Contributing

- Fork the repository
- Create a feature branch (`git checkout -b feature/amazing-feature`)
- Make your changes
- Run linting and validation (`make test`)
- Update documentation (`make docs`)
- Commit your changes (`git commit -m 'Add amazing feature'`)
- Push to the branch (`git push origin feature/amazing-feature`)
- Open a Pull Request
