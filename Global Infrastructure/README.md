# Global infrastructure
A global application is an application deployed in multiple Regions or Edge Locations. They need decreased latency, so the applications are deployed near the users. They have a Disaster Recovery plan not relying only on single regions or availability zones. You also have an attack protection because a global infrastructure is harder to attack.

The global applications in AWS are:
- Route 53 as global DNS for disaster reocvyer and deployment near the users for low latency
- CloudFront is a CDN to replicate and cache data also in the points of presence
- S3 Transfer Acceleration to accelerate global uploads and downloads from S3
- Global Accelerator to improve global application availability using the AWS global network

## Route 53
Is a Managed DNS. The most common records are:
- website url to IPv4 (A records)
- website url to IPv6 (AAAA records)
- url to another url (CNAME)
- url to an AWS resource (Alias)

The Routing Policies can be simple or weighted. 
The weighted can be used to distribute load across multiple instances, so the DNS will respond with different instances IPs according to their weights. 
There can be also a latency policy, that will respond to the user according to the latency (so it will give the user the address of the nearest instances). 
There is also the failover policy, based on healthchecks on a primary instance. If the healthcheck fails, the DNS will respond with the address of a Failover instance

## CloudFront
It's a CDN and improves read performances by caching content in differnete edge locations. Improves the user experience. It's made by 216 Points of prefence (all the AWS Edgle locations). It has a DDOS protection integration with Shield and Web Application Firewall.

It can cache content from S3 buckets for distributing files, with enhanced security with CloudFront Origin Access Identity and can be used to upload files to the S3. It can cache also any custom HTTP origin such as ALB, EC2 instances, S3 websites or any other HTTP backend.

At high level, the Edge Location will ask the content to the origin if not cached and thent it is cached.
The difference with the S3 Cross Region Replication is that with CloudFront you leverage on the global edge network, cache for a certain amount of time and it's great for static content to be delievered. With the S3 replication, you must setup each region you want replication to happen, is read only, and is great for dynamic content that needs to be available for low-latency in few regions.

## S3 Transfer Acceleration
Increases transfer speed by transferring file to an AWS edge location which will forward the data to the S3 bucket in the target region. It's only used to download/upload a file from a bucket far from you.

## Global Accelerator
It is used to improve application availability and performance using the AWS global network. It can optimize the internal network and improve performance up to 60%. It uses Edge Locations to connect privately and directly to the applications through the AWS network, so the user will just connect to the nearest edge location. This avoids latency problems. The difference with CloudFront is that CloudFront serves a cached content, while Global Accelerator works as a TCP and UDP proxy and is good for HTTP use cases where static IP addresses are required or when a deterministic, fast regional failover is requested.
Global Accelerator responses improve performance based on the distance: more distance = more performance.

## Outposts
It's made for Hybrid Cloud. Outposts are server racks that offer the same AWS infrastructure to build applications on-premises just as in the cloud. It's a way to use AWS services on the on-premises servers. You are responsible of the security of the Outposts racks. The benefits are:
- low-latency access to on-premises systems
- local data processing
- data residency
- easier migration from on-premises to the cloud
- full managed service
  
## WaveLength
WaveLength Zones are infrastructure deployments embedded with the 5G networks infrastructure. Bring AWS services to the edge of 5G networks. The traffic does not leave the CSP network and there is a direct connection with the AWS region.

