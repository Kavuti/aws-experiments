# Scalability and High Availability
Scalability means that an application can handle greater load by adapting. It can be vertical of horizontal. It's different from high availability.
Scaling vertically in AWS means increasing the size of the instance (common for non distributed systems such as databases). There is usually a limit to the hardware you can use.
Scaling horizontally means increasing the number of instnaces of your application. It's meant for distributed systems. This is very common for web applications. In AWS You use ASG and ELB to scale horizontally.

High Availability goes hand in hand with horizontal scaling. It means running an application at least in 2 Availability Zones. It's meant to survive partial outages. It's like Horizontal scaling but made in multiple availability zones

Scalability is the ability to accomodate a larger load by making the hardware stronger or addingnodes.
Elasticity means that once a system is scalableea, there will be some auto-scaling that allows the system to scale automatically based on the load. It's cloud friendly: pay-per-use, match demand, optimize costs.
Agility means that new resources are available at click, so you are not waiting for weeks anymore but just a few seconds.

## ELB
Load balancers are servers that forward internet traffic to other resources (EC2 here).
It is used to:
- spread the load on multiple instances
- expose a single point of access (DNS) to the application
- handle failures of single instances
- do regular healthchecks
- provide ssl termination
- have high availability across zones

ELB is a managed Load balancer and AWS will take care of it working and of upgrades and maintenance. It provides also a few configurations. It costs less to setup an own load balancer but these costs will be recovered by the lack of maintenance operation burden. It can be of 3 types:
- Application (HTTP/HTTPS) Layer 7
- Network (TCP/UDP) Layer 4
- Classic (retiring) both Layers 4 & 7

## ASG
In real life the load on an application can change. In the cloud we can create servers quickly so Auto Scaling Groups is able to:
- scale out (add) new instances to match increased load.
- Scale in (remove) instances to match the decreased load.
- Ensure we have a minimum and maximum number of machines running
- Automatically register new instances to a load balancer
- Replace unhealthy instanecs.

It's cost saving because you can run at an optimal capacity.
You have a minimum size, an Actual/desired capacity and a maximum size within the ASG can scale the number of instances. The desired capacity is the starting number of instances launched at the ASG start. 
To create new instances, the ASG needs an EC2 Launch Template

The ASG can work with multiple scaling strategies:
- manual: update manually the size of an ASG
- dynamic: respond to traffic demand. It can be simple or step. Example: when a CloudWatch alarm is triggered then add 2 units, or remove 1. It can be also Target Tracking. Example: Ensure CPU is around 40%. It can be also scheduled, to anticipate a scaling based on known usage patterns. Example: increase the min capacity to 10 in a specific date at specific time.
- predictive: uses machine learning to predict future traffic ahead of time. Useful with predictable time-based patterns.