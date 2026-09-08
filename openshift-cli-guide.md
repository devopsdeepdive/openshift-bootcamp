**OpenShift CLI (oc) Guide:**
The OpenShift CLI (oc) is a command-line tool used to interact with and manage an OpenShift Container Platform cluster. It allows administrators, developers, and DevOps engineers to perform most cluster and application management tasks directly from a terminal.

This guide covers how to install and configure the OpenShift CLI on Windows and Linux, connect to an OpenShift cluster, and perform common administrative and application-management operations.

The examples in this guide are intended for OpenShift 4.x / SNO (Single Node OpenShift) training environments.

**What this guide covers:**
Installing oc CLI on Windows
Installing oc CLI on Linux
Connecting to an OpenShift cluster
Logging in using username/password or token
Checking cluster and OpenShift version

**Note**: Please create Redhat Account 
https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/auth?client_id=rhcom&redirect_uri=https%3A%2F%2Fwww.redhat.com%2Fen%2Fdashboard&response_type=code&scope=openid+profile_level.rh_events+id.email+id.idp+id.job.title+id.job.department+id.name+id.organization+id.sub+id.username+roles+profile+api.graphql+api.console+api.ask_red_hat&state=faa2de9090dc4426b73bcf79ab67ffa8&code_challenge=-ZQpOhwI_6pHg7N4gKSqPuuCBUC79y2LX8-QTbwcUD0&code_challenge_method=S256

#**Install OpenShift CLI on Linux**:

Download the OpenShift CLI from:
```
https://console.redhat.com/openshift/downloads?utm_source=chatgpt.com
```
Filename : OpenShift command-line interface (oc)
Download Link: https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux.tar.gz

```
wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux.tar.gz
tar -xvzf openshift-client-linux.tar.gz
sudo mv oc kubectl /usr/local/bin/
oc version
```
**Login from Linux**
Use your SNO credentials:
```
oc login https://api.sno2.openshifttraining.online:6443 \
  -u kubeadmin \
  -p 'YOUR_PASSWORD'
```
Then verify:
```
oc whoami
```
Check the cluster:
```
oc get nodes
```


#**Install OpenShift CLI on Windows**:
<img width="995" height="160" alt="image" src="https://github.com/user-attachments/assets/63912ab2-2b5f-4c3f-9283-69b87793a12e" />

Extract the ZIP.
You'll have:
oc.exe
kubectl.exe
For example:
C:\openshift\oc.exe
C:\openshift\kubectl.exe 

Add C:\openshift to your Windows PATH."
Windows GUI (recommended)
Press Windows + S
Search for:
environment variables
Click Edit the system environment variables
Click Environment Variables...
Under User variables for <your-user>, select Path
Click Edit
Click New
Add:
C:\openshift
Click OK → OK → OK

Open PowerShell and verify:
```
oc version
```
Login from Windows:
```
oc login https://api.sno2.openshifttraining.online:6443 -u kubeadmin -p "YOUR_PASSWORD"

oc whoami
```


