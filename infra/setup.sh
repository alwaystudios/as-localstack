#!/bin/sh

set -eo pipefail

terraform workspace new test-infra
terraform init test-infra
terraform apply -auto-approve test-infra

echo "Setup done."
