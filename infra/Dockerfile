FROM hashicorp/terraform:0.11.14

WORKDIR /workspace

COPY infra.tf ./test-infra/infra.tf
COPY variables.tf ./test-infra/variables.tf
COPY terraform.tfvars terraform.tfvars

COPY provider.tf ./test-infra/provider.tf
COPY provider.tf ./project/provider.tf

COPY ./setup.sh /setup/setup.sh

ENTRYPOINT ["/setup/setup.sh"]
