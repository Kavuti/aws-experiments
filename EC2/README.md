# EC2
Is an Infrastructure as a Service. Consists of:
- Renting virtual machines
- Storing data on virtual drives (EBS)
- Distribute load across machines (ELB)
- Scaling the services using an auto-scaling group (ASG)

It's the base of how the cloud works

## Sizing and configuration options
- Operating System: Linux, Windows or Mac os
- CPU amount
- RAM amount
- Storage space amount
    - network-attached (EBS & EFS)
    - Hardware (EC2 Instance Store)
- Network card options: speed and public IP address
- Firewall rules: security group
- Bootstrap script (EC2 User Data)

## EC2 User data
Script launched once when machine starts. They could do something like installing or updating software, downloading files, or anything else, all launched as root user (sudo)

## What happens when you create an instance
You have to set sizing and configuration options mentioned above. If set, the virtual machine will acquire a public IP to use to access it. If the instance is stopped, you stop paying for the compute. If an instance is restarted, it will acquire a new different public IP if set to. If you terminate an instance it will be permanently destroyed. The storage volume related to the machine could be whether deleted or preserved according to the configuration option.

## Instance types
There are 5 different types of EC2:
- General Purpose
- Compute Optimized
- Memory Optimized
- Accelerated Computing
- Storage Optimized
- Instance Features
- Measuring Instance performance.

### Naming convension:
example: m5.2xlarge

m: instnace class
5: generation (aws improves)
2xlarge: size within instance class

General purpose are good for diverse workloads such as web servers or code repositories
They are balanced between compute, memory and networking