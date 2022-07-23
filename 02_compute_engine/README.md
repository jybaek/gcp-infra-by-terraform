# intro
Create the following resources:

- Cloud Load Balancer
- Instance templates
- Instance groups

## Architecture
Below is an architectural image created after Terraform is executed.

![alt text](./images/compute-engine.png)

## Precautions

A _health-check_ is included. _Health-check_ fails until the application is actually started.