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
