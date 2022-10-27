# Cloud Integration
Services made to make the applications communicate each other. The pattern can be synchronous or asynchronous (event-based, usually managed by a queue). Synchronous communication is a problem when there are sudden spikes. The asynchronous services scale independently from our application

## SQS
Simple Queue Service. A Queue is a collector of messages made by one or more producers and read by consumers by polling the messages. When a message is processed the message is deleted from the queue.
The standard queue (the other is the FIFO queue) is the oldest offer (10 years old). It's fully managed and serverless. Scales from 1 message to 10000s per second. Has a default retention of 4 days, maximum 14. No limit to the messages number. Low latency (<10 ms to publish and receive). 
SQS can be used to decouple between application tiers.

## Kinesis
Kinesis is a real-time big data streaming. It's a managed service to collect, process and analyze real-time streaming data at scale. Kinesis Data Streams is for low latency streaming and data ingestion. Data Firehose load streams into storage like S3, Redshift, etc... Data Analytcs performs analytics on streams with SQL and Video Streams monitor real-time video streams for analystics or ML. 

## SNS
Simple Notification Service. Used for a pub/sub communication pattern. The same message is deliveded to multiple receivers. Publishers send message to one SNS topic and many subscribers listen to SNS topic notifications. It can have up to 12,5M subscriptions per topic and a limit of 100k topics. Subscribers can be aws services like SQS, Lambda, Kinesis Data Firehose, but can send Emails, SMS, Mobile notifications and call web endpoints.

## Amazon MQ
SQS and SNS are proprietary protocols. Traditionals protocols like MQTT, AMQP, are supported by Amazon MQ. It's a managed message broker for RabbitMQ and ActiveMQ. So you can get a managed version of one of these services. It scales less than SQS and SNS, runs on servers and has both queue and topic features