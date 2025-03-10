.PHONY: init format validate plan apply destroy clean setup all check docs help init-all

MODULES := $(shell find ./modules -type d -not -path "*/\.*" | grep -v "modules$$")

all: init format validate docs

init:
	terraform init

format:
	terraform fmt -recursive

validate: init
	terraform validate
	@find ./modules -type d -name ".terraform" -prune -o -name "*.tf" -exec dirname {} \; | sort -u | xargs -I {} sh -c 'cd {} && terraform validate'

docs:
	@for module in $(MODULES); do \
		if [ -f "$$module/main.tf" ]; then \
			echo "Generating docs for $$module"; \
			cd "$$module" && terraform-docs markdown . > README.md && cd - > /dev/null; \
		fi; \
	done

check:
	pre-commit run --all-files

plan: validate
	terraform plan -out=tfplan

apply:
	terraform apply tfplan

destroy:
	terraform destroy

clean:
	rm -rf .terraform/ tfplan
	@find . -type d -name ".terraform" -exec rm -rf {} +
	@find . -name ".terraform.lock.hcl" -delete
	@find . -name "*.tfstate*" -delete
	@rm -rf dist/

setup:
	asdf install
	@if ! command -v pipx >/dev/null; then \
		echo "Installing pipx..."; \
		brew install pipx; \
		pipx ensurepath; \
	fi
	pipx install pre-commit
	pre-commit install

init-all:
	@find ./modules -type d -name ".terraform" -prune -o -name "*.tf" -exec dirname {} \; | sort -u | xargs -I {} sh -c 'cd {} && terraform init -backend=false'

help:
	@echo "Available targets:"
	@echo "  init         - Initialize terraform in current directory"
	@echo "  init-all     - Initialize terraform in all module directories"
	@echo "  format       - Format terraform code"
	@echo "  validate     - Validate terraform code"
	@echo "  docs         - Generate terraform docs"
	@echo "  check        - Run pre-commit checks"
	@echo "  plan         - Create terraform plan"
	@echo "  apply        - Apply terraform plan"
	@echo "  destroy      - Destroy terraform resources"
	@echo "  clean        - Clean up generated files and directories"
	@echo "  setup        - Setup development environment"
	@echo "  all          - Run format, validate, and docs (default)"
