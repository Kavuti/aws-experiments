# Other Services

## Workspaces
Managed Desktop as a service providing Windows or Linux desktop (Virtual Desktop Infrastructure). You pay only for the actual usage. It's secured and can integrate with KMS. To minimize latency the best practice is to deploy the workspace in the location nearest to the user. 

## AppStram 2.0
It's a Desktop Application Streaming Service so it's meant to delivery applications to computers without infrastructure provisioning. The application can be consumed through a browser. The difference with Workspaces is that you don't have a full desktop, works for any device and you can set up different resources according to the application type (CPU, GPU, RAM)

## Sumerian
Service thought for the creation of VR, AR and 3D applciations. Can be used with ready to use assets. It's accessible through browser or VR/AR devices.

## IoT Core
Meant to easily connect IoT devices to AWS Cloud. Devices can exchange trillions of messages in a serverless, secure and scalable way. Integrates with many AWS services. It's useful to build IoT application to get and analyze data.

## Elastic Transcoder
Converts files in S3 into media files in the format required by consumer services. You create Transcoding Pipelines and the output is put into another S3 bucket. It's easy to use, scalable with large files, cost effective (pay for transcoding time) and is managed and secure.

## AppSync
Meant to store and sync data across mobile and web apps. Uses GraphQL, so client code can be generated automatically. It integrates with DynamoDB and Lambda for the backend. It provides real-time subscriptions and offline dasta synchronization. Has fine grained security and can be used by Amplify.

## Amplify
Set of tool and services to develop and deploy full stack web and mobile applications. It manages Authentication, storage, API, CI/CD, pub/sub and so on... You configure it with Amplify Studio and then AWS translates the configuration into a set of services.

## Device Farm
Fully managed service that tests application againsts many devices and browsers concurrently. It's used to test compatibility. It creates reports and logs. You can also interact with the devices during the tests.

## Backup
Fully managed service to centrally manage and automate backups across AWS services. Supports Point-in-time recovery, Cross-region backups and cross-account backups with AWS Organizations. You can also set retention and lifecycle rules. You create a backup plan and you assign the resources which it should apply. The backups will be saved into S3 buckets.

## Disaster Recovery strategies
Backup and restore consists of saving backups of the on premises servers into the cloud and is cheap. Pilot Light consists of hosting the basic functions of the app in cloud without scaling policies. It costs a bit more of backup and restore. Warm Standby consists of a full version of the app with a minimum size hosted on the cloud and costs more than Pilot Light. Then the Multi-site/Hot-site consists of a full version of the app at full size and it costs the most of all.
The typical failover consists of having multiple instances in multiple regions so if a region/AZ fails there are instance to redirect the traffic.
 
### Elastic Disaster Recovery
Meant to easily recover physical, virtual and cloud-based servers into AWS. Does a continuous block-level replication for the physical servers. In case of disaster recovery you can have your infrastructure online in minutes until you fix the problems.

## DataSync
Moves large amount of data from on-premises to AWS. Can synchronize to S3, EFS, FSx for Windows. It can be done scheduled and tasks can be incremental. You have to run the DataSync Agent on premises that communicates with the AWS service.

## Application Discovery Service
Helps plan migration projects by gathering information about on-premises data centers like server utilization data, dependency mapping. It can use Agentless Discovery, without an agent to get some basic information such CPU, memory, disk, and Agent-based Discovery, to gather more advanced metricsd like system configurations. You can see the results in AWS Migration Hub.

## Application Migration Service
Made to help move on-premises services in AWS. Does a lift and shift solution to migrate servers to AWS. Converts both physical, virtual or cloud-based servers to run on AWS. You need to install a Replication Agent that does a continuous replication of the infrastructure in cloud with low cost resources. Then when you are ready you can simply start the production version of the new infrastructure.

## Fault Injector Simulator (FIS)
Fully managed service for running fault injection experiments on AWS workloads. It's based on Chaos Engineering. Helps to discover hidden bugs and performance bottlenecks. Supports EC2, ECS, EKS and RDS. You create an experiment template, you choose which disruption you want to have and you select the resources to apply. Then you monitor with CloudWatch and EventBridge and stop the experiment to view the results.

## Step Functions
Build serverless visual workflows to orchestrate Lambda functions. You can have sequences, parallelism, conditions, timeouts, error handling. Can integrate with EC2, ECS, on-premises servers and many other services. You can also introduce a human approval feature to proceed with the flow. It's useful for data processing, web applciations. In general for any workflow.

## Ground Station
It's a fully managed service to control satellite communications, process data and scale satellite operations. Provides a global network of satellite ground stations near to AWS regions. You can download you satellite data into your VPC (in S3 or EC2) in seconds. The use cases are weather forecasting, surface imaging, communications, video broadcasts.

## Pinpoint
2-way marketing communications service. Supports email, SMS, push notification, voice, in-app messaging. Allows to segment messages with the right content to customers. Allows to receive replies. Can scale to billions of messages per day. It's usefule for marketing operations. The difference with SNS and SES is that in them you have to manage your message's audience, content and schedule, while in Pinpoint you create templates, delivery schedulers, targeted segments and full marketing campaigns and it's full managed.