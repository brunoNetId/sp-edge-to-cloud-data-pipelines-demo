# Solution Pattern: Edge-to-Core Data Pipelines for AI/ML

The Edge to Core Data Pipelines for AI/ML solution pattern provides an architecture solution for scenarios in which edge devices generate image data, which must be collected, processed, and stored at the edge before being utilized to train AI/ML models at the core data center or cloud.

This solution pattern contains resources to showcase a full circle continuous motion of data to capture training data, train new ML models, deploy them, serve them, and expose the service for clients to send inference requests.


## Tested with

* RH OpenShift 4.12.12
* RHODF 4.12.11 provided by Red Hat
* RHOAI 2.8.0 provided by Red Hat
* RHO Pipelines 1.10.4 provided by Red Hat
* AMQ-Streams 2.6.0-1 provided by Red Hat
* AMQ Broker 7.11.6 provided by Red Hat
* Red Hat build of Apache Camel 4
* Camel K 1.10.6 provided by Red Hat


## Deployment instructions

This Solution Pattern can be automatically self-provisioned from the Red Hat Demo Platform (RHDP). Follow the link below to request in instance:
 - pending URL

<br/>

Alternatively you can run the _Ansible_ playbook manually by performing the following actions.


### 1. Provision a RHOAI environment

1. Provision the following RHDP item:
   * Base RHOAI on AWS: \
https://demo.redhat.com/catalog?item=babylon-catalog-prod/sandboxes-gpte.ocp4-workshop-rhods-base-aws.prod&utm_source=webapp&utm_medium=share-link

   <br/>

1. Alternatively, if you don't have access to RHDP, ensure you have an OpenShift environment available and install Red Hat OpenShift AI, meeting the pre-requisite product versions (see '_Tested with_' section to inspect product versions).

<br/>

### 2. Deploy the Solution Pattern

The instructions below assume:
* You have `ansible-playbook` installed on your local environment.
* You have provisioned an OCP instance (tested with OCP 4.12 + RHOAI 2.8), using RHDP, and a bastion server is available.

<br/>

Follow the steps below based on the following mock user/bastion details (`user@bastion_server`):
   ```
   lab-user@bastion.b9ck5.sandbox1880.opentlc.com
   ```

#### Steps

1. Generate an SSH Key. \
   Generate an authorised key if you don't have one already. \
   With OpenSSH, an SSH key is created using ssh-keygen. \
   In the simplest form, just run `ssh-keygen` and answer the questions. \
   Creating a key pair (public key and private key) only takes a minute. The key files are usually stored in the ~/.ssh directory.
   
   <br>

1. Install the public key in the bastion server
   ```
   ssh-copy-id -i ~/.ssh/my_public_key lab-user@bastion.b9ck5.sandbox1880.opentlc.com
   ```
   <br>

1. Test the authorised key
   ```
   ssh lab-user@bastion.b9ck5.sandbox1880.opentlc.com
   ```
   The login should now complete without asking for a password. \
   Make sure you exit the bastion server after your test.

   <br>

1. Login in Openshift. \
   Use the `oc login` command to login against OpenShift.

   <br/>

1. Set the following property:
   ```
   TARGET_HOST="lab-user@bastion.b9ck5.sandbox1880.opentlc.com"
   ```

   <br>

1. Run the deployment scripts. \
   To execute the ansible playbook, run:
   ```
   ansible-playbook -i ${TARGET_HOST},inventory/openshift.yaml ./install.yaml
   ```

<br/>

### 3. To undeploy the demo

Run:

```
ansible-playbook -i ${TARGET_HOST},inventory/openshift.yaml ./uninstall.yaml
```