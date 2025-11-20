# Databases

## RDS

* RDS stands for Relational Database Service

* For DBs using SQL as a query language

* Storage backed by EBS

* You can’t SSH into your RDS instances

* RDS is a managed service:

    * Automated provisioning, OS patching

    * Continuous backups and restore to specific timestamp (Point in Time Restore)!

    * Monitoring dashboards

    * Read replicas for improved read performance

    * Multi AZ setup for DR (Disaster Recovery)

    * Maintenance windows for upgrades

    * Scaling capability (vertical and horizontal)

<br>

## Aurora

### Overview

* AWS cloud optimized

* Full PostgreSQL and MySQL compatibility

* 5x the throughput of MySQL and 3x of PostgreSQL

* Offers DSQL, the fastest distributed SQL database that is PostgreSQL-compatible

* Aurora storage automatically grows in increments of 10GB, up to 128 TB

* Aurora costs more than RDS (20% more) – but is more efficient

<br>

### Aurora Serverless

* On-demand, autoscaling configuration for Amazon Aurora

    * Automatically starts up, shuts down, and scales capacity up or down based on your application's needs.

* No capacity planning needed

    * There is no database capacity for you to manage.

    * You run your database in the cloud without managing any database instances.

    * You create a database, specify the desired database capacity range, and connect your applications.

* Cost

    * You pay on a per-second basis for the database capacity that you use when the database is active.

    * Can save up to 90% of your database cost compared to the cost of provisioning capacity for peak load.

<br>

## ElastiCache

### Overview

* Serverless, fully managed caching service

* Compatible with Redis, Memcached and Valkey

    * Allows moving to a managed solution with minimal to no application code changes

* Instant scaling to match any application demand

* For multi-Region applications, ElastiCache Global Datastore offers local reads through fully managed, cross-Region replication.

<br>

## DynamoDB

### Overview

* Serverless, fully managed, distributed NoSQL database

* Low cost and auto scaling capabilities

<br>

### DynamoDB – Global Tables

* Make a DynamoDB table accessible with low latency in multiple-regions

* Active-Active replication (read/write to any AWS Region)

<br>

### DynamoDB Accelerator - DAX

* Fully managed, highly available caching service built for Amazon DynamoDB.

* Delivers up to a 10 times performance improvement—from milliseconds to microseconds—even at millions of requests per second.

* DAX does the heavy lifting required to add in-memory acceleration to your DynamoDB tables, without requiring developers to manage cache invalidation, data population, or cluster management.

<br>

## OLAP vs OLTP

### OLAP

* Online analytical processing

* Primary purpose: analyze aggregated data

* Use to generate reports, perform complex data analysis, and identify trends

* Act like a centralized data store and pull in data from multiple data warehouses, relational databases, and other systems

* Storage requirements measure from terabytes (TB) to petabytes (PB).

* Data reads can be compute-intensive, requiring high-performing servers.

* Data architecture

    * Prioritizes data read over data write operations. You can quickly and efficiently perform complex queries on large volumes of data.
    
    * Availability is a low-priority concern as the primary use case is analytics.

* Performance

    * Processing times can vary from minutes to hours depending on the type and volume of data being analyzed

    * To update an OLAP database, you periodically process data in large batches then upload the batch to the system all at once.

### OLTP

* Online transaction processing

* Primary purpose: process database transactions

* Use to process orders, update inventory, and manage customer accounts

* Storage requirements in gigabytes (GB)

* Data architecture

    * Prioritizes data write operations. It’s optimized for write-heavy workloads and can update high-frequency, high-volume transactional data without compromising data integrity.
    
    * Availability is a high priority and is typically achieved through multiple data backups.

* Performance

    * Processing times in milliseconds or less

    * Database updates in real time

<br>

## Redshift

### Overview

* Cloud data warehouse designed specifically for OLAP

* Has a SQL interface for performing queries

* If you want to use SQL and you have structured data (eg CSV files), then Redshift is the simplest solution.

* Powers modern data analytics at scale

* Based on PostgreSQL, but it’s not used for OLTP

* Columnar storage of data (instead of row based)

* Massively Parallel Query Execution (MPP)

* BI tools such as `AWS Quicksight` or `Tableau` integrate with it

<br>

### Redshift Serverless

* Easily run analytics workloads of any size without managing data warehouse infrastructure.

* You pay only for what you use, so you save on costs.

* Offers flexibility to support a diverse set of workloads of varying complexity

* New AI-driven scaling and optimization technology enables Amazon Redshift Serverless to automatically and proactively provision and scale data warehouse capacity, delivering fast performance for even the most demanding workloads

* The system uses AI techniques to learn customer workload patterns across key dimensions, such as concurrent queries, query complexity, influx of data volume, and ETL patterns. It then continually adjusts resources throughout the day and applies tailored performance optimizations.

* You set a desired price-performance target, and the data warehouse automatically scales to meet it.

* Load data and start querying right away in an easy-to-use, zero administration environment.

<br>

## EMR

* EMR stands for “Elastic MapReduce”

* A managed service that makes it easy to process large amounts of data using frameworks like Apache Spark and Hadoop.

* Utilizes MapReduce for processing huge data sets in computing environments.

* If you want to process unstructured data (eg in strange formats rather than structured CSV files), Amazon EMR can provide a Hadoop system that is very capable.

* It allows you to launch and manage clusters of Amazon EC2 instances that work together to analyze data.

* EMR takes care of all the provisioning and configuration

* Auto-scaling and integrated with Spot instances

* EMR Serverless

    * Run open-source big data analytics frameworks like Apache Spark without configuring, managing, and scaling clusters or servers
    
    * Fastest way to get started with all the features and benefits of Amazon EMR without the need for experts to plan and manage clusters

<br>

## Athena

* Serverless service that simplifies data analysis in Amazon S3 using standard SQL

* Analyze petabyte-scale data where it lives with ease and flexibility

* No infrastructure to set up or manage, and you only pay for the resources your query needs to run

* Use Athena to process logs, perform data analytics, and run interactive queries.

<br>

## Quick Sight

* Cloud-based, serverless business intelligence (BI) service to create interactive dashboards

* Provides unified intelligence across all your enterprise data sources

* Use cases:

    * Business analytics

    * Building visualizations

    * Perform ad-hoc analysis

    * Get business insights using data

    * Integrated with RDS, Aurora, Athena, Redshift, S3 ...

<br>

## DocumentDB

* Serverless, fully managed, MongoDB API-compatible document database service

* Compatible with MongoDB APIs and drivers so you can migrate applications, typically without application code changes or downtime.

* Automatically scales capacity up or down in fine grained increments based on your application’s demands, offering up to 90% cost savings compared to provisioning for peak capacity

* Similar “deployment concepts” as Aurora

* DocumentDB storage automatically grows in increments of 10GB

<br>

## Neptune

* Serverless graph database service for connected data

* Instantly scales graph workloads, removing the need to manage capacity

* The only database that gives you the power of connected data with the enterprise capabilities and value of AWS

* A popular graph dataset would be a social network

    * Users have friends

    * Posts have comments

    * Comments have likes from users

    * Users share and like posts ...

* Great for knowledge graphs (Wikipedia), fraud detection, recommendation engines, social networking

<br>

## Timestream

* Fully managed, fast, scalable, serverless time series database

* Automatically scales up/down to adjust capacity

* Store and analyze trillions of events per day

* 1000s times faster & 1/10th the cost of relational databases

* Built-in time series analytics functions (helps you identify patterns in your data in near real-time)

<br>

## Managed Blockchain

* Blockchain makes it possible to build applications where multiple parties can execute transactions without the need for a trusted, central authority.

* Amazon Managed Blockchain is a managed service to:

    * Join public blockchain networks

    * Or create your own scalable private network

* Compatible with the frameworks Hyperledger Fabric & Ethereum

<br>

## Glue

* Managed extract, transform, and load (ETL) service

* Useful to prepare and transform data for analytics

* Fully serverless service

* Glue Data Catalog: catalog of datasets

* Crawlers automatically discover data in your data stores, infer the schema, and update the Data Catalog with the metadata

* Can be used by Athena, Redshift, EMR

<br>

## Database Migration Service

* Quickly and securely migrate databases to AWS

* The source database remains available during the migration

* Supports

    * Homogeneous migrations: Oracle to Oracle
    
    * Heterogeneous migrations: Microsoft SQL Server to Aurora