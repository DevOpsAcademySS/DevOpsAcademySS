# Ansible configuration GCP instances

Here is [link][gcp-ans] for [Official Documentaion][gcp-ans].
Also here is [link][gcp-ans-col] for official documntaion of [Google Cloud Collection][gcp-ans-col].

[gcp-ans-col]:https://docs.ansible.com/ansible/latest/collections/google/cloud/index.html
[gcp-ans]:https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html

## Requisites

---

The GCP modules require both the `requests` and the `google-auth` libraries to be installed.

```sh
pip install requests google-auth
```

Alternatively for **RHEL / CentOS**, the `python-requests` package is also available to satisfy `requests` libraries.

```sh
yum install python-requests
```

## Credentials

---

It’s easy to create a GCP account with credentials for Ansible. You have multiple options to get your credentials - here are two of the most common options:

- **Service Accounts (Recommended)**: Use JSON service accounts with specific permissions.

- **Machine Accounts**: Use the permissions associated with the GCP Instance you’re using Ansible on.

For the following examples, we’ll be using **service account credentials**.

To work with the GCP modules, you’ll first need to get some credentials in the JSON format:

1. [Create a Service Account](https://developers.google.com/identity/protocols/OAuth2ServiceAccount#creatinganaccount)

2. [Download JSON credentials](https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490#serviceaccounts)

Once you have your credentials, there are two different ways to provide them to Ansible:

- **by specifying them directly as module parameters**

- **by setting environment variables**

## Providing Credentials as Environment Variables

---

Set the following environment variables before running Ansible in order to configure your credentials:

```env
GCP_AUTH_KIND=serviceaccount
GCP_SERVICE_ACCOUNT_EMAIL=cred.email@project-name.iam.gserviceaccount.com
GCP_SERVICE_ACCOUNT_FILE=./path/to/json/name-of-json-file.json
GCP_SCOPES=[https://www.googleapis.com/auth/compute]
```

The last step is to install plugin for playbook so its can use commands for GCP:

```sh
ansible-galaxy collection install google.cloud
```

# Conteinerize Geocitizne with Dokcer

To use docker commands in playbooks run next command on your terminal.

```sh
ansible-galaxy collection install community.docker
``` 

Here is [link][docker-ans] to the official documntation of [Community Docker Collection][docker-ans].

[docker-ans]:https://docs.ansible.com/ansible/latest/collections/community/docker/index.html
