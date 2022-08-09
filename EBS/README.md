# EBS
Elastic Block Storage, is a network volume attachable to one instance at time (except for io1 and io2 types, which is named EBS Multi-Attach), and is scoped in the availability zone. It can be attached only to instances in the same availability zone. Being network-based there could be some latency but they can be detached/attached quickly.
To move a volume across availability zones you need to snapshot it.
Their capacity is measured in GB and IOPS (I/O Operations per second) you are billed for both.
Their can live also as detached to an instance.
Every EBS has a Delete on Termination attribute, so their lifecycle will be attached to the EC2 lifecycle. By default the attribute is true.