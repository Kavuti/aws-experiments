# Compute services

## ECS
Elastic Container Service, launches Docker containers in AWS. You must provision and maintain the instances. AWS takes care of starting and stopping containers and has integrations with Application Load Balancer

## Fargate
Launches Docker containers in AWS too, but you don't need to provision the infrastructure so is simpler than ECS. It's actually a serverless offering. AWS runs containers for you based on the CPU/RAM you need.

## ECR
Elastic Container Registry, the private Docker registry used to store docker images. They can then be used with ECS or Fargate

## Serverless services
Developers don't manage servers anymore, just deploy code or functions. Initially serverless was the same of Function as a Service. Now serverless includes every service that is completely managed by AWS. Serverless does not mean there are not server at all, but refers on the lack of provision and management by the user.

### Lambda
Lambdas are functions limited by execution time, running on demand and scaling automatically. All opposite to EC2. The pricing is pay per request and per compute time. The free tier gives 1 millions lambda requests a month and 400k GBs of compute time. It's integrated with the whole AWS suite of services. It's event-driven. You can write them with many programming languages. You monitor them with CloudWatch. It's easy to get more resources for functions. Increasing RAM will increase also CPU and network. You can also run container images on lambda but they must implement the Lambda Runtime API.
The logs of the lambdas are stored on CloudWatch

## API Gateway
It's a fully managed service that can be used as a proxy for APIs. It's serverless and scalable and supports both Restful and websocket APIs. It supports security, authentication and many other things.

## AWS Batch
Used to do batch process at scale. Run hundreds of thousandra of computing batch jobs on AWS. A batch job is a job with a start and an end and will run on to EC2 or Spot instances. AWS provisions the right amount of compute and mamory. You have just to schedule or submit your job to AWS. Batch jobs are defined as Docker images and run on ECS. It's helpful to optimize costs and focus on the batch job. It has no time limits, you can use any runtime that fits in a Docker image and can rely on EBS for storage.

## Lightsail
Gives servers, storae, database and networking. Simpler to use all the needed services in combo. It's good for a little cloud experience. You can setup monitoring and notifications from Lightsail resources. It has high availability but no auto-scaling and limited integrations with other services.
