#!/bin/bash

set -e

# OpenShift SNO kubeconfig
export KUBECONFIG=~/openshift-sno2/auth/kubeconfig

# GCP configuration
INSTANCE="sno2-fdr7n-master-0"
ZONE="asia-south1-b"
PROJECT="openshift-sno-lab"

echo "======================================"
echo " OpenShift SNO Safe Shutdown"
echo "======================================"

echo ""
echo "Checking OpenShift login..."
oc whoami

echo ""
echo "Finding SNO node..."
NODE=$(oc get nodes -o jsonpath='{.items[0].metadata.name}')

echo "SNO Node: $NODE"

echo ""
echo "Cordoning node..."
oc adm cordon "$NODE"

echo ""
echo "Draining workloads..."
oc adm drain "$NODE" \
  --ignore-daemonsets \
  --delete-emptydir-data \
  --force

echo ""
echo "Checking node status..."
oc get nodes

echo ""
echo "Stopping GCP VM..."
gcloud compute instances stop "$INSTANCE" \
  --zone="$ZONE" \
  --project="$PROJECT"

echo ""
echo "======================================"
echo " SNO VM stopped successfully"
echo "======================================"
