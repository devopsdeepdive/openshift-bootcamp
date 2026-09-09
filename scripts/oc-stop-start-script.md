# OpenShift SNO - Safe Stop and Start

## Context

This document explains how to safely stop and start an
OpenShift Single Node OpenShift (SNO) cluster running on GCP.

A SNO cluster has only one node. The same node provides the
OpenShift control plane and runs application workloads.

Because there is no second worker node, workloads cannot be
moved to another node during maintenance.

For this reason, Red Hat recommends:

1. Take an etcd backup before shutdown.
2. Cordon the SNO node.
3. Evacuate workload pods.
4. Shut down the node gracefully.
5. Start the GCP VM again.
6. Verify that OpenShift recovers correctly.

> Important: Stopping the GCP VM is different from deleting the VM.
> Do not delete the VM or its persistent disks when you only want
> to temporarily stop the cluster.

## Why do we need this?

The purpose of this procedure is to allow the SNO cluster to be
stopped when it is not being used, for example to reduce GCP
resource usage, and then started again later without rebuilding
the OpenShift cluster.

Red Hat specifically recommends taking an etcd backup before
shutdown because the backup can be used for recovery if the
cluster does not restart correctly.

### Before stopping
1. Set kubeconfig
```
export KUBECONFIG=~/openshift-sno2/auth/kubeconfig
```
Stop the SNO

Because this is SNO, first cordon the node:

NODE=$(oc get nodes -o jsonpath='{.items[0].metadata.name}')
oc adm cordon $NODE

### Then drain it:

oc adm drain $NODE \
  --ignore-daemonsets \
  --delete-emptydir-data \
  --force

###Now stop the GCP VM:

gcloud compute instances stop sno2-fdr7n-master-0 \
  --zone=asia-south1-b \
  --project=openshift-sno-lab

 ### Start the SNO

When you need the training environment again:

gcloud compute instances start sno2-fdr7n-master-0 \
  --zone=asia-south1-b \
  --project=openshift-sno-lab

