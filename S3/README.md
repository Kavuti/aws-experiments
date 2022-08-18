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