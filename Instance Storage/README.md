# EBS
Elastic Block Storage, is a network volume attachable to one instance at time (except for io1 and io2 types, which is named EBS Multi-Attach), and is scoped in the availability zone. It can be attached only to instances in the same availability zone. Being network-based there could be some latency but they can be detached/attached quickly.
To move a volume across availability zones you need to snapshot it.
Their capacity is measured in GB and IOPS (I/O Operations per second) you are billed for both.
Their can live also as detached to an instance.
Every EBS has a Delete on Termination attribute, so their lifecycle will be attached to the EC2 lifecycle. By default the attribute is true.

## Snapshots
Snapshots are EBS volume backups made at a point in time. Not necessary but recommended to detach the volume to snapshot. The snapshots can be copied across AZ or Regions.


### Snapshot archive
It moves the snapshot in a 75% cheaper archive tier but takes 24 to 72 hours to restore the archive.

### Recycle bin
Setup rule to retain deleted snapshots to use in case of incidents. The retention can be from 1 day to 1 year.

# AMI
Amazon Machine Image, a customizaiton of an EC2 instance (adding software, configuration). Used to boost the configuration time. AMI are in the scope of the region. You can launch EC2 with public AMI provided from AWS, with own AMI or from a n AWS Marketplace AMI (made from someone else).
To create a new AMI you have to:
- create and customize a new EC2 instance
- stop it (for data integrity)
- build the AMI from it (this will also create EBS snapshots)
- Launch a new instance from other AMIs

# Ec2 Image Builder
It's used to automate the creation of Virtual machines or container images: automate the creation, maintain, validate and test EC2 AMIs. The Image Builder creates the instance, configure it. Then a new AMI is created from that instance and will be automatically tested. Finally the AMI can be distributed to multiple regions. The billing of the service is based on the used resources. It can be scheduled to run on a cron schedule or whenever there is an update. You can select single components to be deployed in the instance, choosing also the order the components should be installed.

# Instance Storage
EBS volumes have limited performance. For high performance storage you should use EC2 Instance Store. This storage is lost if the instance is stopped. So it's good for buffer/cache data and temporary content. This storage is susceptible to hardware failures that may cause data loss. Backups and restore for this type of storage are a user responsibility. Their IOPS can go from 35k to 2 millions accordingly to the instance type and type of I/O operation (read, write)

# EFS
It's a managed NFS and can be mounted to hundreds of instances. It works only with linux instances but in multiple AZ. It's highly available, scalabe and expensive. You cannot do capacity planning, just pay per use.

## Infrequent Acccess
Is a storage class optimized for costs and for files not accessed every day. Up to 92% lower costs. EFS will move automatically the files to the Infrequent Access based on the last time they were accessed. You can enable this with a Lifecicle Policy. It's transparent to the applications that are using EFS

# Shared responsibility model
For the EC2 Storage aws will:
- maintain infrastructure
- replicate data across EBS volums and EFS drives.
- replace faulty hardware
- ensure employees are not accessing your data

The user will:
- set up backup/snapshot procedures
- set up data encryption
- have responsibility of data on drives
- understand the risk of using EC2 Instance Store

# FSx
It's a service made to launch 3rd party high-performance file systems on AWS. It's fully managed. Currently there are Lustre, Windows file server and NetApp ONTAP.
Windows file server supports SMB protocol and NTFS. It's integrated with Microsoft Active ADirectory and can be accessed from AWS or from on-premises infrastructure.
Lustre is made for High Performance Computing. Lustre comes from Linux and Cluster. It's good for ML, Analytics, video processing. Scales up do 100 GB/s millions of IOPS and low latency.