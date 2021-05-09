# Carto - Core Infrastructure

Uses [Terraform](terraform.io) to generate the core infrastructure for the Carto Bot.

## Prerequisites

The following resources are required before this infrastructure can be created;

1. Google Cloud Platform account
2. A project to create the infratructure in (e.g. `carto-discord`)
3. (Optional) A billing account linked to the project

You also need to install Terraform locally.

## What is created

The following resources are created by the terraform configurations;

| Resource                  | Notes                                                                                                                                                                                                                                      |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| App Engine App            | Cannot be deleted once created, see the [provider documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application) for an explanation. Initialised with a `CLOUD_FIRESTORE` database. |
| Terraform Service Account | Allows other projects to use a service account for automated deployments. A private key is output at the end of running `terraform apply` for use in future pipelines, so make sure this is kept secret.                                   |
| Project API Services      | These APIs are activated from the start; <br/><ul><li>Cloud Build</li><li>Cloud Functions</li><li>Cloud Storage</li><li>Compute Engine</li><li>IAM Service</li><li>Firestore</li><li>Pub/Sub</li></ul>                                     |
| Storage Bucket            | This bucket is reserved for automated deployment `.tfstate` file. The appropriate ACL is set on it such that only the Terraform Service Account can access it (and project owners of course).                                              |

## Creation

It's as simple as

```bash
terraform init  # Initialise and download the providers (latest version)
terraform apply # Create the infrastructure. You must be logged into the gcloud cli
```
