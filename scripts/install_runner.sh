#!/usr/bin/env bash

# Parameters
GREEN='\033[0;32m'
NC='\033[0m'

# Cluster Parameters
NSCM=$(kubectl get namespace cert-manager -o name 2>&1)
NSARS=$(kubectl get namespace actions-runner-system -o name 2>&1)
SCM=$(kubectl get secret controller-manager -n actions-runner-system 2>&1)

# Install Cert-Manager
if [[ "${NSCM}" = *"not found"* ]]; then

    kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.1.0/cert-manager.yaml
else
    echo "namespace cert-manager exists"

fi

# Install actions-runner-controller
if [[ "${NSARS}" = *"not found"* ]]; then
    kubectl apply -f https://github.com/summerwind/actions-runner-controller/releases/latest/download/actions-runner-controller.yaml
else
    echo "namespace actions-runner-system exists"
fi

# Create personal access token secret
if [[ "${SCM}" = *"not found"* ]]; then
    echo -e "${NC}${GREEN}Add your github repo personal access token:${NC}"
    read token
    kubectl create secret generic controller-manager -n actions-runner-system --from-literal=github_token=$token
else
    echo "namespace actions-runner-system exists"
fi
