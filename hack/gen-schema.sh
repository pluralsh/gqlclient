#!/usr/bin/env bash

set -euo pipefail

cd $(dirname $0)/..

source hack/lib.sh

CONTAINERIZE_IMAGE=node:19 containerizeNode ./hack/gen-schema.sh
npm install -g get-graphql-schema
get-graphql-schema https://app.plural.sh/gql > schema.graphql
chmod 755 schema.graphql
