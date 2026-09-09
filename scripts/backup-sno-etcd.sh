#!/bin/bash

set -e

# OpenShift SNO kubeconfig
export KUBECONFIG=~/openshift-sno2/auth/kubeconfig

# Backup directory
BACKUP_DIR=~/sno2-backup

echo "======================================"
echo " OpenShift SNO - etcd Backup"
echo "======================================"

echo ""
echo "Checking OpenShift login..."
oc whoami

echo ""
echo "Creating backup directory..."
mkdir -p "$BACKUP_DIR"

echo ""
echo "Creating etcd snapshot..."

oc adm etcd snapshot save \
  "$BACKUP_DIR/snapshot-$(date +%Y%m%d-%H%M%S).db"

echo ""
echo "Checking backup..."
ls -lh "$BACKUP_DIR"

echo ""
echo "======================================"
echo " etcd backup completed"
echo "======================================"
