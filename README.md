# GCP infra by Terraform
It is a [boilerplate code](https://en.wikipedia.org/wiki/Boilerplate_code) project that can be used universally. Go to the samples directory and use it. Any contributions are welcome as long as they don't hurt the overall structure. Let's play together!

## example
| example directory                                            | description                                                                                                |
|--------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| [01_welcome_terraform](01_welcome_terraform)                 | This is a basic example for training Terraform. Create a VPC in the cloud                                  |
| [02_compute_engine](02_compute_engine)                       | Create a VM instance                                                                                       |
| [03_instance_group](03_instance_group)                       | Create the following resources: Cloud Load Balancer, Instance templates, Instance groups                   |
| [10_kubernetes_engine](10_kubernetes_engine)                 | Create a GKE cluster                                                                                       |
| [12_gke_autopilot_gateway](12_gke_autopilot_gateway)         | Create a GKE Autopilot cluster with Workload Identity Federation and Gateway API support                   |
| [20_cloudrun](20_cloudrun)                                   | Create an artifact registry and create a cloud run service that takes images from artifact_registry        |
| [22_cloudrun_v2_direct_vpc](22_cloudrun_v2_direct_vpc)       | Create a Cloud Run v2 Service and Job connected to a custom VPC via Direct VPC Egress                      |
| [25_eventarc_workflows](25_eventarc_workflows)               | Create an event-driven serverless pipeline with Cloud Storage, Eventarc, and Cloud Workflows               |
| [30_cloud_sql](30_cloud_sql)                                 | Create a database                                                                                          |
| [33_alloydb](33_alloydb)                                     | Create a AlloyDB                                                                                           |
| [35_memorystore_redis](35_memorystore_redis)                 | Create a memorystore(redis)                                                                                |
| [36_memorystore_valkey](36_memorystore_valkey)               | Create a Memorystore for Valkey cluster with Private Service Connect (PSC)                                 |
| [39_spanner](39_spanner)                                     | Create a spanner database                                                                                  |
| [40_cloud_storage](40_cloud_storage)                         | Create a bucket                                                                                            |
| [45_bigquery_biglake](45_bigquery_biglake)                   | Create a BigQuery + BigLake Iceberg Lakehouse and Zero-ETL Pub/Sub BigQuery Direct Subscription            |
| [50_cloud_composer](50_cloud_composer)                       | Create Cloud Composer 2                                                                                    |
| [60_cloud_pubpub](60_cloud_pubsub)                           | Create one topic and two subscriptions. Subscriptions are push and pull respectively                       |
| [75_github_wif_cloud_deploy](75_github_wif_cloud_deploy)     | Create Keyless GitHub Actions OIDC Workload Identity Federation and Cloud Deploy Canary delivery           |
| [80_zero_trust_iap_secret](80_zero_trust_iap_secret)         | Create a Zero-Trust private VM with IAP TCP Tunneling, Secret Manager, and Cloud Armor WAF                 |
| [90_vertex_ai_platform](90_vertex_ai_platform)               | Create a Vertex AI Workbench instance and Vertex AI Vector Search streaming index & endpoint               |

Check out the [sample](sample) path for more interesting end-to-end examples (including [genai-rag-server](sample/genai-rag-server) and [llm-serving-on-gke](sample/llm-serving-on-gke))!

## Requirements
- [Terraform](https://www.terraform.io/)
- That's all!

## Usage
Specify the path of the key file as an environment variable.
```shell
$ export GOOGLE_CLOUD_KEYFILE_JSON=/path/to/file
```

You must enter the project_id at run time. If you don't like it, set it as an environment variable like the one below.
```shell
$ export TF_VAR_project_id="foo-1234"
```

And go to the samples directory. Run Terraform in terminal like below! You are initializing
```shell
$ terraform init
```

Check the terraform plan.
```shell
$ terraform plan
```

And apply!
```shell
$ terraform apply
```

To clean up resources, use the destroy command.
```shell
$ terraform destroy
```

## Precautions
Some services require you to enable resources in the GCP Console.

## License
[MIT](./LICENSE)
