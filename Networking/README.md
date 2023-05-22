# Networking
The concepts to know are:
- VPC, Subnets, Internet Gateways & NAT Gateways
- Security Groups, Network ACL, VPC Flow Logs
- VPC Peering, VPC Endpoints
- Site to Site VPN & Direct Connect
- Transit Gateway

## VPC and Subnets
VPC is Virtual Private Cloud and is a private network in the scope of a region where you can deploy resources.
Subnets are parts of a VPC and are in the scope of the Availability Zone. A public subnet is a subnet accessible from the internet. A private subnet is not accessible from the internet.
Subnets are made of Route Tables.
Any VPC has a CIDR range.

## IP Addresses.
AWS supports IPv4. When an instance is created it gets a new public IPv4 even when you stop and restart them. There are also private IPv4 usable in internal networking, that is fixed for each instance.
Elastic IPs are fixed public IPv4 addresses attachable to EC2 instances.
You pay for it only if the instance is stopped or it's not attached to any instance.
It supports also IPv6 addresses. Every IP is public.

## Internate Gateway & NAT Gateway
To create a public subnet, you must create an Internet Gateway and set a route from the subnet to the gateway. This makes the instance able to connect to the internet and to be public. NAT Gateway and NAT instances are made to allow the instances in Private Subnets to access the internet while remaining private. The NAT Gateway (or instance) is placed in the Public Subnet and we create a route from the private subnet to the NAT Gateway and from the NAT Gateway to the Internet Gateway.

## Network ACL & Security Groups
Network ACL (NACL) is a firewall that controls traffic from and to subnet. It has both ALLOW or DENY rules attached to Subnet level. The rules only include IP addresses
The security group is a firewall that controls traffic from and to a Network Interface or an instance. It can have only ALLOW rules (denies by default) and the rules can include both IPs or other security groups.
In the NACL the return traffic must be allowed explicitly, in the security groups it's always allowed. The NACL automatically applies to all the instances in the subnet.
A NACL can be associated to multiple subnets

## VPC Flow Logs
Are logs of all the IP traffic going into the interfaces. It can be applied to VPCs, Subnets or single Network interfaces. It helps to monitor and troubleshoot connectivity issues between subnets or between subnets and internet. It captures also informations from the AWS managed interfaces. They can be stored in CloudWatch, S3 and some others storage services

## VPC Peering
Allows to connect two VPCs using the AWS Network. They behave like they are the same network. The CIDRs must not overlap and the connection is not transitive, so all VPCs will must be peered directly with the other VPCs they need to communicate with. The peering VPCs can be in different regions and in different accounts.

## VPC Endpoints
VPC Endpoints allow to connect to AWS services using a private network instead of the public network. This gives enhanced security and lower latency. There are two types of VPC Endpoints:
- Gateway, to connect only to S3 buckets of DynamoDB
- Interface, to connect to all the other services

## AWS PrivateLink
AKA VPC Endpoint Services. It's a way to securely and scalably expose a service to thousands of VPCs. VPC Peering would not scale for many VPCs. This does not require VPC peering, gateways or route tables. To do it the VPC vendor must create a Network Load Balancer, and the consumer VPC must create a Network Interface. Then PrivateLink will connect these two through the AWS private network. 

## Direct Connect & Site-to-Site VPN
Site-to-Site VPN is used to connect on-premises VPN to AWS. The connection is encrypted and goes through the public internet. The on-premises server must install a Customer Gateway and on AWS you must create a Virtual Private Gateway. Then you can connect them with the Site-to-Site VPN
Direct Connect is used to enstablish a physical connection between on-premises and AWS. It's a private connection, secure and fast but a physical connection must be made, so it takes at least a month to be established. 
To decide which to use, you have to ask yourself if the connection must be private or not and how much quickly it needs to be established.

## Client VPN
Used to connect from your computer to a private network in AWS using OpenVPN. If the VPC has established with a Site-to-Site VPN, the PC will access also the on-premises resources

## Transit Gateway
The network topologies can become very complicated. The Transit Gateway can create transitive peering between thousands of VPCs and on-premises connection. It works with also with VPN connections and Direct Connect Gateways.

