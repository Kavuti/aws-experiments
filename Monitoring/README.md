## CloudWatch Metrics
Provides metrics for every service (CPU, network, etc...). Metrics have timestamps and can creare dashboards with the different metrics. Some important metrics are CPU, Status checks, Network in and out for EC2 instances.
Default metrics are every 5 minutes and there is the option to store metrics every 1 minute (costs more).
For EBS volumes you have Disk read and writes.
For S3 bucket syou have Bucketsize, number of objects and all requests.
For billing you have total estimated charge.
Service limits allow to set limits to the use of the services. You can also push custom own metrics.

## CloudWatch Alarms
Triggers notifications when some metric goes over a threshold. You can have alarm actions for example auto-scale some instances or do operation on instances or send notifications with SNS. You have various options to create the alarms and can choose the period on which to evaluate alarm. You can create also a billing alarm. The states are OK, INSUFFICIENT_DATA, ALARM.

## CloudWatch Logs
Collects logs. Can collect logs from:
- Elastic Beanstalk
- ECS
- Lambda
- CloudTrail based on filter
- Cloudwatch Agents on EC2 machines and on-premises servers
- Route53: logs dns queries

Enables real-time logs monitoring and has a configurable retention.

## EventBridge (ex CloudWatch Events)
Schedules scripts (cron jobs). Has also event pattern matching: event rules to react to a service doing something (e.g. root user sign in -> send notification). It can interact with several other AWS services (EC2, Lambda, SQS, SNS, etc...). It's possible to receive events from AWS partners such as Datadog or Zendesk in a different event bus. You can also create other event buses other than the default for the applications. There is a Schema Registry to model the events schema. You can archive events with a retention. You can also replay archived events.

## CloudTrail
Provides governance, compliance and audit for the account. It's enabled by default. It traces all the api calls made with the account (console, sdk, cli, all services). Its logs can be put into CloudWatch Logs. It can be applied to all the regions. It's useful if a resource is deleted and you need to investigate.

## X-Ray
Debugging distributes systems is hard. X-Ray makes a visual analysis of the our applications. The advantages are that you can:
- troubleshoot performance
- understand microservices dependencies
- Pinpoint service issues
- review requests behavior
- find errors and exceptions
- check is SLAs are met
- check why a service is throdttled
- identify which users are impacted from an outage

## CodeGuru
ML-powered for automated code reviews and applciation performance recommendations. Reviewer is the tool for static code analysis (used in development). Profiler is the tool that does recommentations about applciation performance (used in production). Reviewer supports Java and Python and GitHub, BitBucket or Codecommit.
Profiler helps to identify code inefficiencies, gives anomaly detection, and is supported on AWS or on-premise. Its overhead is minimal

## Service Health Dashboard
This dashboard shows all regions and all services health. Shows historical informations for each day. Has also an RSS feed for notifications.

## Personal Health Dashboard
Shows health of services and resource used by the account. SHows how aws outages impact on your aws resources. It can also send alerts.