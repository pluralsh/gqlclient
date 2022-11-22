#!/usr/bin/env bash

set -euo pipefail

cd $(dirname $0)/..

source hack/lib.sh

CONTAINERIZE_IMAGE=golang:1.19.3 containerize ./hack/gen-api-client.sh
go run github.com/Yamashou/gqlgenc@v0.0.8
