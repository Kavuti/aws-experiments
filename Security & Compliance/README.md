# Security and Compliance
The AWS responsibility is to protect any infrastructure component that runs the AWS services.
The customer is responsible of the management of the OS, firewall and network configurations, IAM, and anything is not managed. It's responsible also for the data encryption.
The shared responsibility is in patch management, configuration mangement, awareness and training. 

## Shield
The standard plan protects against DDoS attacks to websites and applications for free for all customers. Provides protection from attacks as SYN/UDP floods, Reflection and layer 3/4 attacks.
The advanced is a 24/7 premium DDoS protection. Costs 3k$ per month, protects against more sphisticated attacks on compute and network services. and you have a 24/7 access to a response team. Protects also against higher fess during DDoS spikes.
Cloudfront and Route 53 provide availability protection with global edge network and combined with Shield can provide a mitigation. The auto-scaling helps to respond to all the requests.

The users are routed to Route53, then the request should go to a CloudFront distribution with WAF and then there should be a Load Balancer with autoscaling.

## Waf
WAF is tused to filter specific requests based on rules. It protects against web exploits (layer 7). It's deployed on Application Load Balancer, API Gateway and CloudFront. It allows to define Web ACL to set rules for IP addresses, HTTP headers/bodies, URI strings. Protects also from common attacks such as SQL injection and XSS. It can be used to block some countries with geo-match. It has also rate-based rules to protect against DDoS protection.

## Penetration Testing
Customers can carry out security assessment without approval against some AWS services. Some activities are prohibited such as DNS zone walking via Route 53 Hosted Zones, real DoS or simulation, port flooding, protocol floouding, request flooding. For any other simulated event you have to contact AWS.

## Encryption
Encrypting data at rest consists of encrypting data in hard disks, dsatabases, s3 glaciers, etc...
Encrypting data in transit consists of encrypting data transferred on the network. Data should be encrypted in both states to be really protected.

### KMS
Key Management Service. AWS manages the encryuption keys for us with KMS. You can use it to encrypt EBS volumes, S3 Buckets, databases, EFS drives. For some services encryption is automatically enabled.

### CloudHSM
It's a service to manage encryption keys on a dedicated hardware given from AWS. The HSM is tamper resistant. The Customer Managed Customer Master Keys (CMK) allow to define a rotation policy or define own key. The AWS Managed CMK are used by AWS services (s3, ebs, etc...). The AWS owned CMK are a collection of keys used in multiple accounts that you can use but can't see. Then the CloudHSM keys are generated from the hardware device and the cryptographic operations are performed by CloudHSM.

## Certificate Manager
Is a service for SSL/TLS certificates provisioning, the certificates are applyed to Application load balaners. It supports both public and private TLS certificates. It's free of charge for public TLS certificates and has an automatic renewal. It integrates with Load Balancers, Cloudfront distributions, APIs on API Gateway.

## Secrets Manager
It's a service to store secrets. It can apply a rotation every N days. It can automate hte generation of secrets on rotation. It integrates with RDS to generate and rotate credentials. Secrets are encrypted using KMS. 

## Artifact
It's not really a service but is a portal that provides on-demand access to AWS complianc. It creates reports for security and compliance like SOC, PCI, ISO. It allows to review the status of Agreements such as BAA, HIPAA for individual accounts or organization.

## GuardDuty
It's and intelligent threadt discovery to protect the account. It uses anomaly detection and 3rd party data without installing anything. Input data include CloudTrail Events Logs, VPC Flow Logs, DNS logs, Kubernetes Audit logs. You can setup CloudWatch Event rules to be notified in case of findings. It can protect against CryptoCurrency attacks.

## Inspector
Automated security assessments for EC2 instances, leveraging the AWS SSM agent to analyze the OS, the newtork. It can be used also for ECR to assess the container images that are pushed. It can be applied also to Lambda Functions to assess the code and the dependencies. The report can be integrated with AWS Security Hub or with EventBridge to run some automation scripts. It does a continuous scanning, only when needed. 

## Config
Helps auditing and compliance on services by recording configuration changes over time. The data can be stored into S3 and analyzed by Athena. It can fire alerts through SNS. Is in the scope of the region but results can be aggregated in multiple regions/accounts. It's not included in the free tier.

## Macie
Fully managed data security and privacy service leveraging machine learning and pattern matching to discover sensitive data in AWS. It identifies and alerts you to sensitive data such as personal identifiable information through EventBridge and its integrations.

## Security Hub
Is a tool to automat security checks across accounts.
Has an integrated dashboard showing status and allowing to take actions. Aggregates data from GuardDuty, Inspector, Macie, IAM Access Analyzer, Systems Manager, Firewall Manager, Partner Network Soluzions. You need to first enable AWS Config. To investigate on root causes, you can yous Amazon Detective. The pricing is per-check and by ingestion events.

## Amazon Detective
Since it's complex to identify root causes of security checks, Detective analyzes the issues with graphs and Machine Learning. Collects automatically and processes events from VPC Flow Logs, CloudTrail, GuardDuty to create a view.

## AWS Abuse
If you are suspecting some resources are being used for illegal purposes you can report it to AWS. For example you can do it in cas of spam, port scanning, DDoS attacks, intrustion attemts, hosting copyrighted content, distributing malware. You can just compile the AWS abuse form or send an email to abuse@amazonaws.com

## Root user privileges
The root user is the account owner. Has complete access to all the services and resources. It should be locked and not used for everyday (even administrative) tasks. Some actions can be performed only by the root:
- Change account settings
- View certain invoices
- Close the account
- Restore IAM user permissions
- Change Support plan
- Register as a seller in the Reserved Instance Marketplace.
- Configure an S3 bucket to enable MFA
- Edit or delete S3 policy that include invalid VPC information.
- Sign up for GovCloud

## IAM Access Analyzer
Finds out which resources are shared externally. BUckets, IAM Roles, KMS Keys, Lambda functions and Layers, SQS queues, Secrets. You can define a Zone of Trust (account or organization) and it finds any access outside the zone of trusts. 