### SNO (Single Node OpenShift) Installation Setup:
RedhatLink https://docs.redhat.com/en/documentation/openshift_container_platform/4.20/observability/installing_on_google_cloud/index?utm_source=chatgpt.com
SNO = Single Node OpenShift, and for this fresh setup we're going to build SNO only.

**Our target**
             YOUR LOCAL PC
          ┌─────────────────┐
          │ gcloud          │
          │ openshift-install│
          │ oc              │
          └────────┬────────┘
                   │
                   │ GCP API
                   ▼
            GOOGLE CLOUD
          ┌─────────────────┐
          │ 1 VM            │
          │                 │
          │ OpenShift SNO   │
          │                 │
          │ Control Plane   │
          │ + Worker        │
          │ + API           │
          │ + Ingress       │
          │ + Operators     │
          └─────────────────┘
Step 1 — Install Google Cloud CLI
1. Download the official installer

Use Google's official download page:
https://docs.cloud.google.com/sdk/docs/install-sdk?utm_source=chatgpt.com

2. Run the installer

When the installer opens, keep the normal/default options.

You can select:

☑ Install Bundled Python
☑ Add gcloud CLI to PATH
☑ Create Start Menu shortcut

The bundled Python option is useful because you don't need to separately install Python just for gcloud

Step 2 — Verify gcloud

After installation, close any existing CMD/PowerShell window and open a new PowerShell.

Run:

gcloud --version

Step 3 — Login to Google Cloud

Run:

gcloud auth login

A browser should open.

Sign in with the Google account that owns/has access to your GCP project.

After successful login:

gcloud auth list

You should see something like:

Credentialed Accounts

ACTIVE  ACCOUNT
*       your-account@gmail.com

  Step 4 — Initialize gcloud

Now run:

gcloud init

Google's gcloud init configures your active account and default project.

You'll be asked something like:

Pick configuration to use:
 [1] Re-initialize this configuration
 [2] Create a new configuration

For a completely fresh setup, I recommend creating a separate configuration:

2

Give it a name such as:

**openshift-sno**

Then authenticate/select your Google account.

Step 5 — Select your GCP project

If you already created the project, run:

**gcloud projects list
**
Verify:

**gcloud config get-value project
**
It should return your project ID.

use the GCP region asia-south1.
Configure it now

In PowerShell:

**gcloud config set compute/region asia-south1**
Then:

**gcloud config set compute/zone asia-south1-a
**
Verify:

**gcloud config list**
###Step 3 — Enable required GCP APIs

For the OpenShift installation, we'll need several GCP services. Let's enable them now:
**gcloud services enable `
compute.googleapis.com `
iam.googleapis.com `
cloudresourcemanager.googleapis.com `
dns.googleapis.com `
servicenetworking.googleapis.com `
storage.googleapis.com**
