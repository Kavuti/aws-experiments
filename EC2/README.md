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