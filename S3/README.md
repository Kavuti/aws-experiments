# S3
Is one of the main services. It's advertised as "infinitely scaling" storage. Many websites use S3 as backbone and many services have an integration with S3.

## Use cases
They are:
- Backup and storage
- Disaster recovery
- Archive data
- Hybrid Cloud storage
- Application hosting
- Media hosting
- Data lakes and Big data analytics
- Software delivery
- Static website

## Overview
Allows to store objects (files) in buckets (directories). Buckets must have a globally unique name (acorss regions in all accounts)
The buckets are region-scoped.
The naming convention requires:
- no uppercase
- no underscore
- 3-63 characters
- not an ip
- must start with lowercase letter or a number

## Objects
They are files and have a key. The key is the FULL path. It's composed by the prefix and the object name. There is no concept of directory, but they are simulated by the keys. 
They can be max 5TB and to upload more than 5GB you must use the multi-part upload.
They have metadata (list of key/value pairs containing system or user data).
They can have tags (up to 10 key/value pairs).
They can have a version if versioning is enabled.

## Security
It can be user based by creating IAM policies.
It can be also resource based:
    - bucket policies: bucket wide rules across all account
    - Object Access Control List (ACL) for fine grained permissions on objects
    - Bucket Access Control List (ACL) that is less common
An IAM principal can access an S3 object if:
    - the user IAM permissions allow it or the resource policy allows it.
    - there is no explicity DENY
Objects can be encrypted using encryption keys.

For a public access you need to use a bucket policy allowing public access (assigned to the bucket)
For a single user access you need to use IAM Permissions (assigned to the user)
If you need an EC2 to access a bucket, you need to use IAM Roles (assigned to the instance)
For cross-account access you need to use a bucket policy allowing cross-account access (asssigned to the bucket)

### Bucket Policies
JSON based policies. The resources are buckets and objects. The actions are a set of API to allow or deny actions. The effect is always allow/deny. The principal is the user or account to apply the policy to. They are used to:
- grant public access to the bucket
- force objects to be encrypted at upload
- grant access to another account to the bucket (cross-account access)

The public access is denied by default to avoid data leaks. The bucket access settings could be set at account level so it's important to pay attention.

## S3 Website
S3 can host static websites. The url would be [bucket-name].s3-website-[AWS-region].amazonaws.com or [bucket-name].s3-website.[AWS-region].amazonaws.com. If a 403 is returned there may be some issue with the bucket policy.

## Versioning
You can version the files in the S3. It's enabled at the bucket level. The keys will have a version. It's used to protect againsta unintended deletes and for easy rollbacks to previous versions. If versioning is enabled the files will have "null" previous version and suspending versioning will not delete the previously versioned files. Deleting a files, if there are no other versions, leaves a "deleted" marker on that files and you are able to revert the deletion

## Access Logs
For auditing, all access should be logged. Any request made to S3 from any account, will be logged into another S3. Data can be analyzed and it's usefule to come down to the root of an issue or check suspicious accesses.

## Replication
Can be cross-region or same-region. To have it versioning must be enabled. Buckets can be in different accounts and the copy is asynchronous. To have replication, you must give proper IAM permissions to S3.
CRR is used for compliance, lower latency and replication across accounts. SRR is used for log aggregation, live replication between production and test accounts. The files copies maintain the same version number.

## Storage Classes
There are different storage classes:
- Standard, general purpose
- Standard Infrequent Access
- One Zone Infrequent Access
- Glacier Instant Retrieval
- Glacier Flexible Retrieval
- Glacier Deep Archive
- Intelligent Tiering

Can move between classes manually or with lifecycle rules.

They assure durability and availability. High durability (99,999999999%) of objects across multiple Availability Zones. If you sotre 10.000.000 objects in S3 you can incur a loss of a single object every 10k years.
The durability is the same for all classes.
The availability measures how readily available a service is. Varies dependoing on the storage classe. 

### Standard general purpose
Has 99.99% availability, used for frequently accessed data, low latency and high throughput, sustain 2 concurrent facility filuares. Usable for big data analytics, mobile and gaming applications, contend distribusion

### Standard Infrequent Access
For data that is less frequently accessed but with rapid access when needed. Lower cost. 99,9% availability. Usable for Disaster recovery and backups

### One Zone Infrequent Access
High durability but in a single AZ. If AZ is destroyed, data is lost. 99.5% availability. usable for strong secondary backup of on premise data or for data you can recreate.

### Glacier
Low-cost meant for archiving and backup. You pay for both storage and object retrieval cost. 
The Instant Retrieval is great for data accessed once a quarter, data must be stored for at least 90 days. 
Glacier Flexible can be Expedited (1-5 minutes), Standard (3-5 hours), Bulk (5-12 hours) and is free. The minimum storage duration is also 90 days. 
The Deep Archive is Standard (12 hours) or bulk (48 hours) and the minimum storage time is 180 days.
The Intelligent-tiering gives a small monthly monitoring and autp-tiering free and moves objects across different tiers. 
The default tier is the frequent access.
After 30 days of not accessing they are moved in Infrequent Access. 
After 90 days in Archive Instance Access tier. 
Optionally from 90 to 700+ days (configurable) they are moved to Archive Access tier.
Optionally from 180 to 700+ days (configurable) they are moved to Deep Archive Access tier

## S3 Object Lock
To adapt a WORM (Write Once Read Many) model. Block an object version deletion for a specified amount of time.

## Glacier Vault Lock
Same model, lock the policy for future edits. It's helpful for compliance and data retention

## Encryption
Three types:
- No encryption
- Server-side, the S3 encrypts the file after receiving it.
- Client-side, the user encrypts the file before uploading it.

## Shared Responsibility model
AWS will be responsible of security, durability, availability, concurrent loss of data in two facilities, configuration and vulnerability analysis and compliance validation.
The user is responsible of versioning, policies, replication, logging, monitoring, Storage classes and data encryption.

## AWS Snow Family
High secure portable device used to collect and process data at the edge or to migrate data in/out of AWS. The data migrations should be done with Snow family in order to have good performance in migrating data against limited connectivity, bandwidth, network costs and shared bandwidth, connection stability.
With snow family, the client requires a device to AWS, uploads there the device and then it's reshipped to aws that will do the import/export.
Steps:
- request the snowball device
- install the snowball client or AWS OpsHub on servers
- connect the snowball to the servers and copy the files
- ship back the devies
- data will be loaded into an S3
- snowball is wiped

The second use case after migrations is the edge computing. It can be used to process data while it's being created on an edge location, with limited or absent connectivity and computing power. Usually it's used to preprocess data, machine learning, transcoding media.
All the snow family devices can run EC2 instances and Lambda functions (using AWS IoT Greengrass). There are long-term options to save some costs (1 and 3 years)

### Snowball Edge
Physical box to move TBs or PBs, pay per data transfer job, S3 compatible. It can be storage optimized, 80 TB or compute Optimized, 42 TB. It's used for large data cloud migrations, Data Center decommision or disaster recovery. The storage optimized can be clustered up to 15 nodes. The compute optimized can have an optional GPU. It also has 52 vCPUs and 208 GiB of ram. Generally, the compute optimized is used for high computing workloads such as machine learning.

### Snowcone
Smaller than edge, more portable. 8TB of usable storage. Snowcone should be used when Snowball does not fit physically. It can be sent back to AWS or connected to internat and use AWS DataSync to send the data.

### Snowmobile
It's a real truck to transfer exabytes of data. It has 100 PB of capacity (multiple can be used in parallel). High security, controlled, geolocalized and 24/7 surveillance. It's obviously completely offline.

### Smaller Snowcone
Used for edge computing, 2CPU, 4GB ram, usb-c.

### OpsHub
It's a software to manage the devices, with a GUI. Used to unlocking devices, transferring files, managing instances running on devices, monitor devices, launch compatible services on devices (EC2, datasync, nfs)

## Storage Gateway
AWS pushed for hybrig cloud. Due to long migrations, secuirty requirements, compliance requirements, and strategy. Storage Gateway is used to expose on-premises data. Can bridge on-premise data with cloud data. It's useful for disaster recovery, backup and restore, tiered storage. There are 3 types:
- File Gateway
- Volume Gateway
- Tape Gateway

