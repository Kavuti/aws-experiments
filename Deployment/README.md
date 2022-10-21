## CDK
Cloud Development Kit to express infrastracture with a familiar progarmming language. The code is compiled into a CloudFormation template in JSON or YAML. You can deploy infrastructure and application runtime together. It's good for Lambda functions and containerized systems.

## Beanstalk
Ideal to implement a three-tier architecture for our application. It's a developer centric view of deploying applciations on AWS. It uses all the components to create a Platform as a Service. Beanstalk itself is free, you just pay for the instances you use.
It's managed (os managed by beanstalk). Deployment strategy is performed by beanstalk and configurable. It manages the provisioning, load balancing, auto-scaling and monitoring. The responsibility of the developer is just the applcation code. It supports Java, Go, .NET, Node.js, PHP, Python, Ruby, Docker, Packer and others.

## CodeDeploy
Used to automate the application deployment. It works with EC2 instances and with on-premises servers, so it's a hybrid service. You have to install the CodeDeploy agent on the servers you are using.

## CodeCommit
It's a VCS system git-based.

## CodeBuild
Compiles and tests the code in the cloud (CI). It's fully managed, serverless (pay only for build time), scalable, secure and highly available.

## CodePipeline
It's used to manage the different steps to have code pushed to production (CD). It's an orchestrator for the others Code* services. It's fully managed, compatible with many services (including external ones). You have fast delivery and rapid updates.

## CodeArtifact
Used to store the code dependencies. It's an alternative to setup own artifact management system. It works with the most common dependency management tools like Maven, Gradle, pip and others. Developers and CodeBuild retrieve dependencies from CodeArtifact.

## CodeStar
It's a UI to manage all software development activities in one place. It gives a dashboard to manage software development projects to be set up with the AWS services.
Can edit the code online with ASW Cloud9.

## Cloud9
Cloud IDE to write, run and debug code in the cloud.

## Systems manager (SSM)
Helps manage EC2 and on-premises systems at scale. It's another Hybrid AWS service. It's used to do automatica patching on instances, run commands across entire fleet, store parameter configuration with SSM Parameter Store. Works for both Windows and Linux. You need to install SSM agent in the system. It's installed by default on Amazon Linux AMI and some Ubuntu AMI.
The SSM Session manager is used to start a secure shell without a SSH access, bastion host or SSH key. The port 22 doesn't need to be exposed. No specific configuration on security groups is needed. 
You just need to give the instances the policy from the AmazonSSMManagedInstanceCore role.

The SSM proxies commands through the agent. You can send session logs to S3 or CloudWatch Logs.

## OpsWorks
It's a managed Chef & Puppet. It's an alternative to AWS SSM. It's used to provision only standard AWS resources. It has different layers that get information from a Cookbook Repository and an Application repository.