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

### General Purpose
General purpose are good for diverse workloads such as web servers or code repositories
They are balanced between compute, memory and networking

### Compute Optimized
They are good for tasks that require high percformance processors:
    - batch processing
    - media transcoding
    - high performance computing
    - machine learning
    - gaming servers
they are identified by letter "c"

### Memory Optimized
Fast performance for workloads with large datasets in memory:
    - dmbs
    - web scaled distributed cache stores
    - in memory databse
    - real time processing
they are identified by letter "m"

### Storage Optimized
Storage intensive tasks:
    - transaction processing
    - databases
    - in memory cache
    - data warehouses
    - distributed file systems
they are identified by letter "i" or "d"

## Security Groups
Responsible for network security in AWS. They controll ingress and egress networking of EC2 instances. They can contain only "allow" rules. They can reference 
a specific IP or other security groups. They are like a firewall. They can regulate:
    - ports access
    - ip range authorized
    - control inbound network
    - control outbound network.
A security group has a Type, a Protocol, a Port range, a source ip and a text description.

A single security group can be attached to multiple instances. They scope is based on the combination of region + vpc: changing region or creating a new vpc requires a new security group. Lives outside the instances so blocked traffic won't be seen by the instances. It's a best practice to maintain a security group only for SSH access. If the application is not accessible there is a security group issue (timeout). If there is a connection refused the error is in the application. 
All inbound traffic is blocked by default
All outbound traffic is allowed by default

Referencing other security groups is a way to allow traffic with machines that have the specified security groups attached.

### Ports
The ports to know are the following:
- ssh 22
- ftp 21
- sftp 22
- http 80
- https 443
- rdp 3389


## Purchasing Options
- On-Demand: for short workloads and pay by second
- Reserved: for long workloads (1 & 3 years). You can have convertible instances and change their type. They can also be Scheduled
- Saving plans (1 & 3 years): similar to reserved but more flexible for type changes
- Spot: short workloads, can be lost
- Dedicated hosts: book entire physical server
- Dedicated instances: you may share your hardware with other instances but not with other customers
- Capacity Reservations: reserve capacity in AZ

### On-Demand
Linux and windows pay per second after the first minute, other pay per hour.
Higher cost by no upfront payment
No long-term commitment

Ideal fro short and un-interrupted workloads.

### Reserved
Up to 72% discount, you reserve specific instance type in specific region, tenancy and specific os. You can reserve it for 1 or 3 years (the more time, the more discount) and you can pay with a partial, total or null upfront (upfront = discount). You can reserve in a specific region or availability zone. Ideal for applications with a state like databases. You can buy and sell this instances in the Reserved Instance Marketplace. With the convertibles you can change the type, the family, os, scope and tenancy for a less discount (about 66%)

### Saving plans
Discount same as reserved (72%), but you must fit a certain type of usage ($10/hour for 1 or 3 years), the usage beyond the plan is billed at On-Demand price.
Their family and region are fixed but other parameters can be changed at willing

### Spot
About 90% discount. You can lose them if your max price is less than the current spot price. The most cost-efficient instances

Useful for workloads resilient to failure and not critical or stateful applications.

### Dedicated hosts
Physical server with EC2 isntance. You have to address your compliance requirements and use your software licenses. They can be On-Demand or reserved and is the most expensive option. It's usedful for software with complicated licensing model or to respect strong regulatory or compliance needs.

### Dedicated instances
Similar to hosts but you could have more instances sharing the same hardware. You have no control over instance placement.

### Capacity Reservations
Reserve on-demand instances in a specifica AZ. Without commitment (create/cancel anytime), no discounts. They can be combined with Regional Reserved and Saving Plans to benefit from discount. You pay also if your instances are not running.  Suitable for short-term uninterruped workload in a specific AZ.

## Shared Responsibility Mode
AWS is responsible of 
- infrastructure and network security,
- isolation on physical hosts
- replacing faulty hardware
- compliance validation

User is responsible of
- security groups rules
- operating-system patches and updates
- software and utilities installed
- IAM Roles and user access management
- Data security on instance