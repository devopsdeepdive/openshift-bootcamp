#!/bin/bash

set -e

# OpenShift SNO kubeconfig
export KUBECONFIG=~/openshift-sno2/auth/kubeconfig

# GCP configuration
INSTANCE="sno2-fdr7n-master-0"
ZONE="asia-south1-b"
PROJECT="openshift-sno-lab"

echo "======================================"
echo " Starting OpenShift SNO"
echo "======================================"

echo ""
echo "Starting GCP VM..."

gcloud compute instances start "$INSTANCE" \
  --zone="$ZONE" \
  --project="$PROJECT"

echo ""
echo "Waiting for VM to start..."
sleep 30

echo ""
echo "Checking VM status..."

gcloud compute instances describe "$INSTANCE" \
  --zone="$ZONE" \
  --project="$PROJECT" \
  --format="value(status)"

echo ""
echo "Waiting for OpenShift API..."
sleep 30

echo ""
echo "Checking OpenShift node..."

oc get nodes

echo ""
echo "Checking Cluster Operators..."

oc get clusteroperators

echo ""
echo "Checking Cluster Version..."

oc get clusterversion

echo ""
echo "Checking all pods..."

oc get pods -A

echo ""
echo "======================================"
echo " SNO startup verification completed"
echo "======================================"
