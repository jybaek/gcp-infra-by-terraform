# GCP infra by Terraform
It is a [boilerplate code](https://en.wikipedia.org/wiki/Boilerplate_code) project that can be used universally. Go to the samples directory and use it. Any contributions are welcome as long as they don't hurt the overall structure. Let's play together!

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
export TF_VAR_project_id="foo-1234"
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

## Precautions
Some services require you to enable resources in the GCP Console.

## License
[MIT](./LICENSE)