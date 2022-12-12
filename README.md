[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://vshymanskyy.github.io/StandWithUkraine/)

# GCP infra by Terraform
It is a [boilerplate code](https://en.wikipedia.org/wiki/Boilerplate_code) project that can be used universally. Go to the samples directory and use it. Any contributions are welcome as long as they don't hurt the overall structure. Let's play together!

## example
| example directory                            | description                                                                                         |
|----------------------------------------------|-----------------------------------------------------------------------------------------------------|
| [01_welcome_terraform](01_welcome_terraform) | This is a basic example for training Terraform. Create a VPC in the cloud                           |
| [02_compute_engine](02_compute_engine)       | Create a VM instance                                                                                |
| [03_instance_group](03_instance_group)       | Create the following resources: Cloud Load Balancer, Instance templates, Instance groups            |
| [10_kubernetes_engine](10_kubernetes_engine) | Create a GKE cluster                                                                                |
| [20_cloudrun](20_cloudrun)                   | Create an artifact registry and create a cloud run service that takes images from artifact_registry |
| [30_cloud_sql](30_cloud_sql)                 | Create a database                                                                                   |
| [33_alloydb](33_alloydb)                     | Create a AlloyDB                                                                                    |
| [35_memorystore_redis](35_memorystore_redis) | Create a memorystore(redis)                                                                         |
| [39_spanner](39_spanner)                     | Create a spanner database                                                                           |
| [40_cloud_storage](40_cloud_storage)         | Create a bucket                                                                                     |
| [50_cloud_composer](50_cloud_composer)       | Create Cloud Composer 2                                                                             |
| [60_cloud_pubpub](60_cloud_pubsub)           | Create one topic and two subscriptions. Subscriptions are push and pull respectively                |

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
