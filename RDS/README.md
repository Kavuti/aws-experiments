# Databases
Storing data on disks has limits. Used to store data in a structured data and build indexes for queries and relationships between datasets.
The benefits of managed databases are that AWS will manage:
- The availability
- The scaling
- Backups and restore
- Upgrades and patches
- Monitoring and alerting

If you run a database in an EC2 you will have to self-manage all these things.

## RDS
It's a managed Relational database service. It can be a Postgres, MySQL, MariaDB, Oracle, SQL Server or Aurora (aws proprietary). It's backed up and restored to specific timestamps continuously. It's replicated, Multi AZ for disaster recovery. There are maintenance windows for upgrades. The storage it uses it's a gp2 or io1. You cannot SSH into the RDS instances.

The multi-az deployment creates other inactive replicas that start when the primary become inactive. The backups are taken by the inactive replica. The database engine versione upgrades happen on the primary replica.

The Read replicas allow to have replicas used only for reading. They are not considered in backups. They can be spanned across the same AZ, multiple AZs or multiple regions. They can be promoted to standalon instances. The version upgrades are independent from the source instance.

The RPO (Recovery Point Objective) is the maximum period of data loss aceptable, measured in minutes, over which the loss would be unacceptable.
The RTO (Recovery Time Objective) is the maxuimum downtime permitted to recover form backup. Measured in hours or days.

### Aurora
Not open source. It supports PostgreSQL and MySQL. It's cloud optimized and claims 5x performance improvement over MySQL and 3x over postgres. Storage increments automatically from 10GB to 64 TB. Costs 20% more but is more efficient and is not in the free tier.

Important: select the free tier template (not dev/test) when creating a new RDS instance.

### Deployment Options
The Read Replicas are replicas used to scale the read workload of the DB. Can create up to 5 read replicas. Data is written only on the main DB.
Multi-AZ deployments are useful as failover in case of AZ outage. Data is written and read only on the main database. You can have max 1 replica in another AZ.
Multi-Region deployments are read replicas across different regions. Everytime data must be written it must be done on the main database. It's usefule for disaster recovery in case of region issue or for better performance in reads. It will cost more.

## Elasticache
It's a managed Redis or Memcached. In-memory databases with low latency and high performance. It's useful to reduce load off databases for read intensive workloads. Its os, optimizations, configuration, monitoring, failure recovery and backups are fully managed by AWS.
A traditional solution architecture includes an ELB+ASG with instances reading from the DB and reading/writing from cache (ElastiCache)

## DynamoDB
Fully managed NoSQL Database with available replication across 3 AZ. Scales to massive workloads and is a distributed serverless database. Scales to millions of requests per seconds, trillions ov rows and 100s of TB of storage. Single-digit millisecond latency. Is integrated with IAM for security and authorization and administration. Has low cost and auto scaling. Has Standard and Infrequent Access table classes.
It's a key/value database. You have the primary key (simple or composite) and the attributes of the row.

### DAX (DynamoDB Accelerator)
Fully managed cache for DynamoDB. Specific for DynamoDB (not an ElastiCache). Application will pass through DAX instead of calling directly DynamoDB. 10x performance improvement. It's secure, scalable and highly available. 

### Global Tables
It makes a table accessible with low latency in multiple regions. It's a 2-way replication, so the application can read/write in any region and data will be replicated. 

## Redshift
Postgresql-based but not used for OLTP. It's an OLAP database, used for analytics and data warehousing. In redshift you load data once every a while, maybe an hour instead of every second. Has 10x performance than other data warehouses, scales to PBs of data. It's column based instead of row based. Has a Massive Parallel Query execution. It's pay as you go based on the instances provisioned. Has a SQL interface. Business Intelligence tools like Quicksight or Tableau integrate with it. Due to the OLAP nature, it's better to insert data in big batches instead of 
Has a master-slave architecture where the master receives the queries and dispatches them across the slaves. It is mainly single-AZ but multi-AZ is available for some types of cluster. To enable disaster recovery, there is a configurable snapshot functionality that enables snapshotting every 8 hours, every 5GBs or with custom constraints.
Redshift Spectrum is a functionality useful if you want to query data that are in S3 but without loading it into the Redshift cluster. The query is executed by a large pool of Spectrum nodes which aggregate results that are returnte to the cluster's computing nodes.

## EMR 
Elastic MapReduce. It creates Hadoop Clusters to analyze and process big data. The clusters may be of hundreds of EC2 instances. Also supports others like Spark, HBase and others. It takes care of all the provisioning and configuration. There is an autoscaling and is integrated with spot instances. It can be used for data processing, ML, big data analytics, web indexing and all that involves a vast amount of data and processing.

## Athena
Serverless query service to do analytics against S3 objects. Uses SQL to query the files. Supports CSV, JSON, ORC; Avro and Parquet (built on Presto). It can be used to query and analyze and then send the reports and dashboards to QuickSight. You pay 5$ per TB of data scanned. Uses compressed or columnar data for cost savings. The use cases are Business Intelligence, analytics, logs analysis.

## QuickSight
Serverless machine learning-powered business intelligence to create interactive dashboards. It's scalable and embeddable, pricing per-session. It's used for Business Analytics, visualizations, ad-hoc analysis. It's integrated with the various databases in AWS.

## DocumentDB
It's the MongoDB as a service provided by AWS. Stores, queries and indexes JSON data. The deployment is similar to Aurora. Fully managed, replication across 3 AZ, scales the storage in increments of 10GB up to 64 TB. Can serve millions of requests per second.

## Neptune
Fully managed graph database.
Highly available across 3AZ up to 15 read replicas. Useful for application with higly connected datasets. Optimized for complex queries. Can store billions of relations and query the graph with milliseconds latency. Highly available with replications across multiple AZ. Great for knowledge graphs, fraud detection, recommendation engines, social networks.

## QLDB
Stands for Quantum Ledger Database. A ledger is a book recording financial transactions. Fully managed, serverless, replication across 3AZ, used to review history of all the changes made to application data over time. Immutable: no entry can be removed or modified, cryptographically verifiable. 2-3x better performance than common ledger blockchain frameworks. Uses SQL. The difference with Managed Blockchain is that there is no decentralization component, useful for data location regulations.

## Managed Blockchain
Used to build blockchains. It's used to join public blockchain networks or create new blockchains. It's compatible with the Hyperledgers Fabric and Ethereum.

## Glue
It's an ETL service. Useful to transform and prepare data for analytics. Fully serverless. Glue Data Catalog is a data catalog for datasets, where everything about data is saved and can be used by Athena, Redshift and EMR.
One component is the Glue Data Catalog which is used to store the metadata tables, which are defined manually. The metadata are used during the job definition to transform data.
The Table represents the metadata definition describing the data. Contains column names, types, partitions informations and other metadata.
The Classifier determines the schema of the data supporting common file types suche as CSV, JSON, AVRO, XML and others.
The Connection is an object within the catalog that stores connection caracteristics required to connect to specific storages.
The Crawler traverses data in a single run and identifies the schema using Classifiers and generates the metadata stored in the Data Catalog.  `
The ETL are executed within the Apache Spark environment provided by Glue.
A Database is a grouping of Data Catalog table definitions.
A Data Store is the location where the data are stored for extended periods (e.g. S3).
The Data Source is a collection of data used as input for the transformation.
The Data Target is the storage destination where the transformed data are written.
The Transform is the logic used to transform data in the job.
The Job is the union of the business logic, data sources and data targets.
The Trigger initiates the ETL process and can be scheduled or used in response to an event.
A Script is a piece of code generated by Glue as PySpark or Scala script 

Glue provides a Development Endpoint to develop and test the ETL effectively. It provides also a Notebook Server to execute PySpark commands for development purposes on the development endpoint.
 
The Dynamic Frames are self-describing Data Frames eliminating the need for an initial schema. 
Some use cases are running serverless queries across S3 datalake, Understanding data assets through the Data Catalog, create Event-Driven ETL Workflows integrating with Lambda and prepare data for storage into a data warehouse or data lake.

## DMS
Long named Database Migration Service. Useful to move data from a source db to a target db through an EC2 instance. The source database remains availble. Supports homogeneus and heterogeneus migrations (SQL Server to Aurora, Oracle to Oracle, etc..)
