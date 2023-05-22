# Architecting
The Well Architected Framework is based on a few principles:
- Stop guessing the capacity needs 
- Test systems at production scales. 
- Also automate architectural experimentation. 
- Allow evolutionary architectures designed for changing requirements. 
- Drive architectures using data, not guessing.
- Simulate application flash sale days to stress test.

Some of the design principles are the following;
- Scalability (horizontal and vertical)
- Disposable resources: everything should be disposable and eeasy configured.
- Automation: Serverless, IaS, autoscaling
- Loose Coupling: avoid creating monoliths, avoid cascade failures
- Think in services, not servers: don't use just EC2 but use managed services.

The pillars are:
1) Operational Excellence
2) Security
3) Reliability
4) Performance efficiency
5) Cost Optimization
6) Sustainability

they are not trade-offs, they are a synergy.

## Operational Excellence
Ability to monitor systems and delivery business value to improve supporting processes and procedures. Design principles:
- Everything as IaC
- Annotate documentation after every build
- Make frequent, small and reversible changes
- Refine operation procedures frequently
- Anticipate failure
- Learn from failures

To prepare infrastructure use CloudFormation, AWS Config
To operate on infrastructure use CloudFormation, AWS Config, CloudTrail, CloudWatch, X-Ray
To Evolve use CloudFormation, CodeBuild, CodeCommit, CodeDelpoy, CodePipeline

## Security
includes the ability to protect information, systems and assets while delivering business value through risk assessments and mitigation strategies. Design principles:
- Implement strong identity foundation: Work on IAM
- Enable traceability
- Apply security at all levels
- Automate security best practices
- Protect data in transit and at rest.
- Keep people away from data
- Prepare for security events doing simulations

For Identity and Access Management use IAM, STS, MFA ttokens, AWS Organizations.
For detective controls use AWS Config, CloudTrail and CloudWatch.
For infastructure protection use CloudFront, Shield, WAF, Inspector
For Data protection use KMS, S3 encryption, ELB with HTTPS, EBS and RDS.
For Incident Response use IAM, CloudFormation, CloudWatch Events.


## Reliability
Ability to recover from disruptions, acquire new resources automatically and mitigate misconfiguration or transient issues.
Design principles:
- Test recovery procedures
- Automatically reover from ailure
- Scale horizontally to increase system availability
- Stop guessing capacity
- Manage change in automation 

As foundations there are IAM, VPC and Service Limits (now called Service Quotas), Trusted Advisor.
For Change Mangement there is Auto Scaling, CloudWatch, CloudTrail, Config.
For failure management there are Backups, CloudFormation, S3 for backup and S3 Glacier, Route53 for high reliable DNS.

## Performance Efficiency
Ability to use resources efficiently and maintain that efficiency as demand changes and technologies evolve.
Design principles:
- Democratize advanced technologies making them as services
- Go global in minutes
- Use serverless architectures
- Experiment more often
- Mechanical sympathy (be aware of all AWS services)

For Selection use Auto Scaling, Lambda, EBS, S3, RDS
For Review use CloudFormation, AWS News blog
For Monitoring use CloudWatch, Lambda
For Tradeoffs use RDS, Elasticache, Snowball, CloudFront

## Cost Optimization
Deliver business value at the lowest price.
Design Principles:
- Adopt a consumption mode (pay as you go)
- Measure overall efficiency with CloudWatch
- Stop spending money on data center operations
- Analyze anad attribute expenditure (with tags)
- Use managed and application level services to reduce cost of ownership
For Expenditure Awareness use Budgets, Cost and Usage Report, Cost Explorer, Reserved Instance Reporting.
For Cost-Effective Resources use Spot and Reserved instances, S3 Glacier
To match supply and demand use Auto Scaling and Lambda
For Optimization over time use Trusted Advisor, Cost and Usage Report and AWS News Blog.

## Susatainability
Minimizing environmental impact.
Design Principles:
- Understande the impact (set performance indicators)
- Estabilsh sustainability goals
- Maximize utilization
- Anticipate and adopt new, more efficient hardware and software offerings
- Use managed sarvices
- Reduce the downstream impact of cloud workloads (reduce amount of energy or resources required).
For Right Sizing use Lamdba, Auto Scaling, Fargate
Use Cost Explorer, Graviton machines and Spot instances
Use EFS-IA, S3 Glacier, EBS Cold HDD volumes
Use S3 Lifecycle Configurations and Intelligent Tiering, Amazon Data Lifecycle manager
For data, use RDS Read Replicas, Aurora Global DB, DynamoDB Global Table, CloudFront

## Well-Architected tool
Free tool to test an architecture against the 6 pillars.
You select the workload and review the answers, plus you get videos and documentations on how to improve your architecture.

## Right Sizing
EC2 has many types. You should choose the type that fits your needs at the lowest possible cost. Scaling up is easy so start small. Always look for opportunities to reduce or eliminate some capacity. It's important to do it continuously. CloudWatch, Cost Explorer, Trusted Advisor and 3rd party tools can help monitoring the sizes.
  
## AWS Ecosystem
They are free resources.
There are the AWS Blog, AWS Forums, AWS Whitepapers & Guides, AWS Quick Starts, AWS Solutions. There is also the AWS Support with the tiers Developer, Business and Enterprise to have support from the AWS Engineers. 
AWS Marketplace is a catalog of software from external vendors such as AMIs, CloudFormation templates, SaaS, Containers, and it's billed with the AWS bill. You can sell solutions on the AWS Marketplace.
AWS Training can be Digital or Classroom Training (in person). There is also a Private Training, Training for U.S. Governement and for Enterprise.
AWS Academy is the training for universities.
AWS Professional Services & Partner Network is an organization of experts that is made by a partner network. The Technology partners can provide also hardware, connectivity or software. The Consulting can help you build the infrastructure. The training partners help you learning on AWS. The Competency program is granted to partners that demonstrated proficiency in specialized areas.
AWS Navigate Program helps partners to improve.

## AWS Knowledge Center
Is a catalog of FAQs

## AWS IQ
Is used to engage 3rd party AWS certified experts to work on-demand on a project.
For customers, you can have video-conferencing, contract management, secure collaboration and billing integrated in AWS. You pay per milestone.
For experts you can create a profile, connect with customers, create proposals and request payment.

## AWS re:Post
Replaces AWS Forums.
Is a community forum with AWS-managed Q&A with experts. It's part of the Free Tier. You can earn reputation to build the expert status by providing accepted answers. If you are premium support customer you will have a response from the AWS engineers if the community is not responding.

## AWS Managed Services (AMS)
Provides infrastructure and application support on AWS. It has a team os experts that can manage and operate the infrastructure for security, reliability and availability. Offloads routing tasks. Implements best practices. They run 24/7 365/365. You create a baseline governance.

## AWS Cloud Adoption Framework
Is a paper that helps to execute a plan for digital transformation through AWS, created by AWS professionals takes advantages of best practices. Identifies specific capabilities in successful cloud transformations. CAF groups the capabilities in 6 perspectives:
- Business: helps ensure investments accelerate business outcomes.
- People: helps to create a bridge between technology and business, helping to focus on culture, growth, learning and leadership.
- Governance: helps orchestrating cloud initiatives maximizing organizational benefits and minimizing risks.
- Platform: helps build enterprise-grade and scalable cloud platform
- Security: helps achieve confidentiality, integrity and availability of workloads
- Operations: helps ensure that services are delivered at a level that meets the needs of the business.

The transformations domains are the following:
- Technology: using the cloud to modernize legacy systems
- Process: optimizing operations throught new platforms, using machine learning to improve customer experience
- Organization: Reorganize the teams around products, use agile methods to iterate and evolve
- Product: reimagine business model and new revenue models
