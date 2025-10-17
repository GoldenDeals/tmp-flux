#!/bin/bash

set -e

TAG=$(git rev-parse HEAD)

# Flux system
flux push artifact oci://ghcr.io/goldendeals/flux-hq:$TAG \
  --path="clusters/hq" \
  --source="$(git config --get remote.github.url)" \
  --revision="$TAG" 
flux tag artifact oci://ghcr.io/goldendeals/flux-hq:$TAG --tag deploy

# Base
flux push artifact oci://ghcr.io/goldendeals/base:$TAG \
  --path="base" \
  --source="$(git config --get remote.github.url)" \
  --revision="$TAG" 
flux tag artifact oci://ghcr.io/goldendeals/base:$TAG --tag deploy