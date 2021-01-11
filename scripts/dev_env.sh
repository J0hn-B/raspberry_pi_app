#!/usr/bin/env bash

# Parameters
CLUSTER=$(k3d cluster list | grep dev-cluster)

# Prepare the cluster
if [ "$CLUSTER" ]; then
    echo "Cluster exists"
else
    echo "Cluster does not exist"
    wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
    k3d cluster create dev-cluster --agents 2
    k3d kubeconfig merge dev-cluster --switch-context
fi
