## CloudWatch Metrics
Provides metrics for every service (CPU, network, etc...). Metrics have timestamps and can creare dashboards with the different metrics. Some important metrics are CPU, Status checks, Network in and out for EC2 instances.
Default metrics are every 5 minutes and there is the option to store metrics every 1 minute (costs more).
For EBS volumes you have Disk read and writes.
For S3 bucket syou have Bucketsize, number of objects and all requests.
For billing you have total estimated charge.
Service limits allow to set limits to the use of the services. You can also push custom own metrics.

## CloudWatch Alarms
Triggers notifications when some metric goes over a threshold. You can have alarm actions for example auto-scale some instances or do operation on instances ort send notifications with SNS. You have various options to create the alarms and can choose the period on which to evaluate alarm. You can create also a billing alarm. The states are OK, INSUFFICIENT_DATA, ALARM.

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