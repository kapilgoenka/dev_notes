# AWS

### Regions

* AWS has Regions all around the world

* Names can be `us-east-1`, `eu-west-3`…

* A region is a cluster of data centers

* Most AWS services are region-scoped

<br>

### Availability Zones

* Each region has many availability zones. Example:

    * `ap-southeast-2a`

    * `ap-southeast-2b`

    * `ap-southeast-2c`

* Each availability zone (AZ) is one or more discrete data centers

* They're separate from each other, so that they're isolated from disasters

* They're connected with high bandwidth, ultra-low latency networking

<br>

### Points of Presence (Edge Locations)

* Amazon has 400+ Points of Presence (400+ Edge Locations & 10+ Regional Caches) in 90+ cities across 40+ countries

* Content is delivered to end users with lower latency

<br>
<br>
<br>
<br>
<br>
<br>

# IAM
### Users & Groups

* IAM = Identity and Access Management, Global service

* Root account created by default, shouldn't be used or shared

* Users are people within your organization, and can be grouped

* Groups only contain users, not other groups

* Users don't have to belong to a group, and user can belong to multiple groups

<br>

### Permissions

* Users or Groups can be assigned JSON documents called policies

* These policies define the permissions of the users

<br>

### Password Policy

* Strong passwords = higher security for your account

* In AWS, you can setup a password policy:

    * Set a minimum password length
    
    * Require specific character types:
    
        * including uppercase letters
    
        * lowercase letters
    
        * numbers
    
        * non-alphanumeric characters

    * Allow all IAM users to change their own passwords
    
    * Require users to change their password after some time (password expiration)
    
    * Prevent password re-use

<br>

### Roles for Services

* Some AWS service will need to perform actions on your behalf

* To do so, we will assign permissions to AWS services with IAM Roles

* Common roles:

    * EC2 Instance Roles

    * Lambda Function Roles

    * Roles for CloudFormation

<br>

### IAM Security Tools

* IAM Credentials Report (account-level)
    * A report that lists all your account's users and the status of their various credentials

* IAM Access Advisor (user-level)

    * Access advisor shows the service permissions granted to a user and when those services were last accessed.

    * You can use this information to revise your policies.

<br>

### Summary

* Users: mapped to a physical user, has a password for AWS Console

* Groups: contains users only

* Policies: JSON document that outlines permissions for users or groups

* Roles: for EC2 instances or AWS services

* Security: MFA + Password Policy

* AWS CLI: manage your AWS services using the command-line

* AWS SDK: manage your AWS services using a programming language

* Access Keys: access AWS using the CLI or SDK

* Audit: IAM Credential Reports & IAM Access Advisor

<br>
<br>
<br>
<br>
<br>
<br>

# EC2

### Overview

* EC2 is one of the most popular of AWS' offering

* EC2 = Elastic Compute Cloud = Infrastructure as a Service

* It mainly consists of:

    * Renting virtual machines (EC2)

    * Storing data on virtual drives (EBS)

    * Distributing load across machines (ELB)

    * Scaling the services using an auto-scaling group (ASG)

* Knowing EC2 is fundamental to understanding how the Cloud works

<br>

### Sizing & Configuration

* Operating System (OS): Linux, Windows or Mac OS

* How much compute power & cores (CPU)

* How much random-access memory (RAM)

* How much storage space:

    * Network-attached (EBS & EFS)

    * Hardware (EC2 Instance Store)

* Network card: speed of the card, Public IP address

* Firewall rules: security group

* Bootstrap script (configure at first launch): EC2 User Data

<br>

### User Data Script

* It is possible to bootstrap our instances using an EC2 User data script.

* Bootstrapping means launching commands when a machine starts

* That script is only run once at the instance first start

* EC2 user data is used to automate boot tasks such as:

    * Installing updates

    * Installing software

    * Downloading common files from the internet

    * Anything you can think of

* The EC2 User Data Script runs with the root user

<br>

#### yum update -y

* The command `yum update -y` is used on Red Hat-based Linux distributions (like RHEL, CentOS, Fedora, Amazon Linux) to update installed packages.

* Breaking it down:

    * `yum` - Package manager for RPM-based Linux distributions (similar to apt on Debian/Ubuntu)

    * `update` - Downloads and installs updates for all currently installed packages on the system

    * `-y` - Automatically answers "yes" to all prompts, so the update runs without requiring user interaction

* What it does:

    * Checks for available updates for all installed packages

    * Downloads the updated packages

    * Installs them without asking for confirmation (due to -y flag)

    * Updates system libraries, security patches, and software versions
 
* Common use cases:

    * Used in automated scripts and Dockerfiles

    * Initial server setup to ensure all packages are current

    * Regular system maintenance to get security updates

<br>

#### yum install -y httpd

* The command `yum install -y httpd` installs the Apache HTTP Server (web server) on Red Hat-based Linux distributions.

* Breaking it down:

    * `yum` - Package manager for RPM-based Linux distributions

    * `install` - Installs the specified package(s)

    * `-y` - Automatically answers "yes" to all prompts (no user confirmation required)

    * `httpd` - Package name for Apache HTTP Server

* What it does:

    * Downloads the Apache web server package (httpd) and its dependencies

    * Installs Apache automatically without asking for confirmation

    * Makes the web server software available on the system (but doesn't start it)

* After installation, you typically need to:

        # Start the Apache service
        systemctl start httpd
        
        # Enable it to start on boot
        systemctl enable httpd
        
        # Check status
        systemctl status httpd

* Common use cases:

    * Setting up a web server to host websites

    * Used in provisioning scripts and Dockerfiles

    * Creating a LAMP stack (Linux, Apache, MySQL, PHP)

<br>

#### echo "Hello World from $(hostname -f)" > /var/www/html/index.html

* What does this line in a script do on a Red Hat-based Linux distribution?

    * This command creates a simple HTML web page with a heading that displays "Hello World" along with the server's fully qualified domain name (FQDN).
         
    * Executes `hostname -f` to get the server's full hostname
    
    * Creates an HTML string with that hostname embedded
    
    * Writes (or overwrites) this HTML to `/var/www/html/index.html`
    
    * This becomes the default page visitors see when accessing the web server

    * Example output in the file:

        ```html
        Hello World from web-server.example.com
        ```

* This is typically used in:

    * Demo/test web server setups
    
    * Tutorial scripts to quickly verify Apache is working
    
    * Cloud automation to identify which server you're viewing in a load-balanced setup
    
    * DevOps provisioning scripts to create a simple test page

<br>

### Instance Naming

* m5.2xlarge

    * m: instance class

    * 5: generation (AWS improves them over time)

    * 2xlarge: size within the instance class

<br>

### Instance Categories

* General Purpose

    * Optimized for: Balanced compute, memory, and networking resources

    * Use cases: Web servers, code repositories, small-to-medium databases

    * Description: Versatile instances suitable for diverse workloads requiring balanced resource allocation

* Compute Optimized

    * Optimized for: High-performance processors for computation-intensive tasks

    * Use cases: Batch processing, media transcoding, dedicated game servers

    * Description: Designed for applications that demand superior processor performance

* Memory Optimized

    * Optimized for: Fast performance on large in-memory data processing

    * Use cases: In-memory databases, data analytics, enterprise applications

    * Description: Built to handle workloads requiring substantial memory resources and rapid data access

* Accelerated Computing

    * Optimized for: Hardware accelerators and co-processors (GPUs, FPGAs)

    * Use cases: Floating-point calculations, graphics processing, data pattern matching, machine learning

    * Description: Leverages specialized hardware for enhanced performance on specific computational tasks

* Storage Optimized

    * Optimized for: High-speed I/O operations on large datasets

    * Use cases: High-throughput databases, data processing, data streaming, distributed file systems

    * Description: Delivers millions of low-latency random I/O operations for storage-intensive workloads

* HPC Optimized

    * Optimized for: High-performance computing at scale

    * Use cases: Complex simulations, deep learning, visual effects rendering, scientific modeling

    * Description: Offers optimal price-performance for demanding HPC applications

Each category contains multiple instance families (like T3, M6, C5, R5, etc.) that are variations optimized for specific performance characteristics within their category.

<br>

### t3.micro

* Instance Specifications

    * Family: t3 - This is AWS's burstable performance instance family (good for workloads with variable CPU usage)

    * 2 vCPU - 2 virtual CPU cores

    * 1 GiB Memory - 1 GB of RAM

    * Current generation: true - This is a current-gen instance (not outdated)

* Pricing (per hour)

    * The pricing varies based on which operating system you choose:

    * SUSE Linux: $0.0124/hour (~$9/month)

    * Linux (Amazon Linux/standard): $0.0124/hour (~$9/month)

    * Ubuntu Pro: $0.0159/hour (~$11.60/month)

    * Windows: $0.0216/hour (~$15.77/month)

    * RHEL (Red Hat Enterprise Linux): $0.0412/hour (~$30.08/month)

* Key Points

    * Free tier eligible ✓ - If you're in your first 12 months with AWS, you get 750 hours/month of t3.micro (or t2.micro) for FREE

    * Burstable performance - t3 instances can "burst" to higher CPU when needed, using CPU credits

    * Best for - Web servers, small databases, development/test environments, low-traffic applications

* Cost Example

    * If you run this 24/7 for a full month (730 hours) with Linux:

    * 730 hours × $0.0124 = ~$9.05/month

    * But if you're in free tier: $0 (for first 750 hours)

<br>

### Security Groups

* Act as a "firewall" on EC2 instances

* They regulate:

    * Access to Ports

    * Authorised IP ranges – IPv4 and IPv6

    * Control of inbound network (from other to the instance)

    * Control of outbound network (from the instance to other)

* Security groups rules can reference by IP or by security group

* Can be attached to multiple instances

* Locked down to a region / VPC combination

* Does live "outside" the EC2 – if traffic is blocked the EC2 instance won't see it

* It's good to maintain one separate security group for SSH access

* If your application is not accessible (time out), then it's a security group issue

* If your application gives a "connection refused" error, then it's an application error or it's not launched

* All inbound traffic is blocked by default

* All outbound traffic is authorised by default

<br>

### Classic Ports to know

* 22 = SSH (Secure Shell) - log into a Linux instance

* 21 = FTP (File Transfer Protocol) – upload files into a file share

* 22 = SFTP (Secure File Transfer Protocol) – upload files using SSH

* 80 = HTTP – access unsecured websites

* 443 = HTTPS – access secured websites

* 3389 = RDP (Remote Desktop Protocol) – log into a Windows instance

<br>

### Instance Purchasing Options

* On-Demand Instances – short workload, predictable pricing, pay by second

* Reserved Instances (1 & 3 years) – long workloads

* Convertible Reserved Instances – long workloads with flexible instances

* Savings Plans (1 & 3 years) – commitment to an amount of usage, long workload

* Spot Instances – short workloads, cheap, can lose instances (less reliable)

* Dedicated Hosts – book an entire physical server, control instance placement

* Dedicated Instances – no other customers will share your hardware

* Capacity Reservations – reserve capacity in a specific AZ for any duration

<br>

### Idle Costs

* The Free Tier provides 750 hours per month of usage for t2.micro or t3.micro instances. That's enough to run one instance continuously for the entire month—but not more. If you run two micro instances for just 16 days, you exceed the monthly allocation.

* A common oversight is assuming stopped instances don't count toward cost. While compute charges stop, associated storage costs from Elastic Block Store (EBS) continue. By default, EBS volumes persist after an instance is terminated. Unless deleted manually, these volumes incur standard storage charges, regardless of whether they are in use. Additionally, if you allocate Elastic IPs and do not attach them to running instances, AWS begins charging hourly.

* Key Risk: Leaving EBS volumes or Elastic IPs active after terminating EC2 instances leads to silent cost accumulation.

<br>

### Summary

* EC2 Instance: AMI (OS) + Instance Size (CPU + RAM) + Storage + security groups + EC2 User Data

* Security Groups: Firewall attached to the EC2 instance

* EC2 User Data: Script launched at the first start of an instance

* SSH: start a terminal into our EC2 Instances (port 22)

* EC2 Instance Role: link to IAM roles

* Purchasing Options: On-Demand, Spot, Reserved (Standard + Convertible), Dedicated Host, Dedicated Instance


<br>
<br>
<br>
<br>
<br>
<br>

## Instance Storage

### EBS (Elastic Block Store)

#### What's an EBS Volume?

* A network drive you can attach to your instances while they run

* It allows your instances to persist data, even after their termination

* They can only be mounted to one instance at a time (at the CCPlevel)

* They are bound to a specific availability zone

* Analogy: Think of them as a "network USB stick"

* Have a provisioned capacity (size in GBs, and IOPS)

    * You get billed for all the provisioned capacity

    * You can increase the capacity of the drive over time

<br>

#### Delete on Termination attribute

* Controls the EBS behaviour when an EC2 instance terminates

    * By default, the root EBS volume is deleted (attribute enabled)

    * By default, any other attached EBS volume is not deleted (attribute disabled)

<br>

#### Volume Configuration

```
  ┌───────────────────────────────────────────────────────────────────────────────┐
  │ ▼ Storage (volumes)  Info                                           Simple    │
  ├───────────────────────────────────────────────────────────────────────────────┤
  │                                                                               │
  │ EBS Volumes                                                   Hide details    │
  │                                                                               │
  │ ▼ Volume 1 (AMI Root)                                                         │
  │                                                                               │
  │ Storage type    │ Info          Device name - required │ Info                 │
  │ EBS                              /dev/xvda                                    │
  │                                                                               │
  │ Snapshot │ Info                                                               │
  │ snap-02fa530736a0cf7ff                                                        │
  │                                                                               │
  │ Size (GiB) │ Info              Volume type │ Info        IOPS │ Info          │
  │ ┌──────────┐                   ┌─────────────────┐      ┌──────────────┐      │
  │ │    8     │                   │ gp3         [▼] │      │    3000      │      │
  │ └──────────┘                   └─────────────────┘      └──────────────┘      │
  │                                                                               │
  │ Delete on termination │ Info   Encrypted │ Info         KMS key │ Info        │
  │ ┌──────────────────┐            ┌──────────────────┐    ┌─────────────┐       │
  │ │ Yes          [▼] │            │ Not encrypted [▼]│    │ Select  [▼] │       │
  │ └──────────────────┘            └──────────────────┘    └─────────────┘       │
  │                                                                               │
  │                                  KMS keys are only applicable when            │
  │                                  encryption is set on this volume.            │
  │                                                                               │
  │ Throughput │ Info                Volume initialization rate - new, optional   │
  │ ┌──────────┐                     ┌─────────────────────────────────┐          │
  │ │   125    │                     │ Enter a value                   │          │
  │ └──────────┘                     └─────────────────────────────────┘          │
  │                                  Min: 100 MiB/s, Max: 300 MiB/s               │
  │                                  Additional charges apply                     │
  │                                                                               │
  │  ┌──────────────────┐                                                         │
  │  │ Add new volume   │                                                         │
  │  └──────────────────┘                                                         │
  └───────────────────────────────────────────────────────────────────────────────┘
```

- Volume 1 (AMI Root)

  - This is the primary/boot disk where your operating system will be installed.

- Storage type: EBS

  - Elastic Block Store - AWS's network-attached storage

- Device name: /dev/xvda

  - The Linux device identifier for this disk

- Snapshot: snap-02fa530736a0cf7ff

  - This volume is created from a pre-configured snapshot (the AMI/operating system image you selected)

- Size: 8 GiB

  - Default is 8 GB of storage

  - You can increase this if you need more space (e.g., 20 GB, 30 GB)

- Volume type: gp3

  - General Purpose SSD version 3 (recommended, best price/performance)

  - Other options: gp2 (older), io1/io2 (high performance, expensive)

- IOPS: 3000

  - Input/Output Operations Per Second (disk speed)

  - gp3 gives you 3000 IOPS baseline for free

- Throughput: 125

  - 125 MB/s disk throughput (data transfer speed)

- Delete on termination: Yes

  - When you terminate (delete) the EC2 instance, this disk will also be deleted

  - Recommendation: Keep this as "Yes" for temporary instances, "No" if you want to preserve data

- Encrypted: Not encrypted

  - Data is not encrypted at rest

  - You can enable encryption for security (slight performance overhead)

- KMS key: Select

  - Only relevant if you enable encryption

  - Uses AWS Key Management Service to manage encryption keys

- Volume initialization rate: new, optional

  - For restoring from snapshots faster (costs extra)

  - Min: 100 MiB/s, Max: 300 MiB/s

  - Usually not needed for small instances

Recommendations for Beginners:

* Good defaults:

    * Size: 8-20 GiB (depending on your needs)
    
    * Volume type: gp3 ✓
    
    * IOPS: 3000 ✓
    
    * Delete on termination: Yes ✓
    
    * Encrypted: Up to you (No for testing, Yes for production)

* When to increase size:

    * Running databases: 20-50 GB
    
    * Installing lots of software: 20-30 GB
    
    * Just testing: 8 GB is fine ✓

The default settings shown are perfectly fine for most learning/testing scenarios!

<br>

#### Snapshots

* Make a backup (snapshot) of your EBS volume at a point in time

* Not necessary to detach volume to do snapshot, but recommended

* Can copy snapshots across AZ or Region

* EBS Snapshot Archive

    * Move a Snapshot to an "archive tier" that is 75% cheaper

        * Takes within 24 to 72 hours for restoring the archive

    * Recycle Bin for EBS Snapshots

        * 	Setup rules to retain deleted snapshots so you can recover them after an accidental deletion

        * Specify retention (from 1 day to 1 year)

<br>

### EFS (Elastic File System)

#### What is EFS?

* Managed NFS (network file system) that can be mounted on 100s of EC2

* EFS works with Linux EC2 instances in multi-AZ

* Highly available, scalable, expensive (3x gp2), pay per use, no capacity planning

<br>

#### EFS Infrequent Access (EFS-IA)

* Storage class that is cost-optimized for files not accessed every day

* Up to 92% lower cost compared to EFS Standard

* EFS will automatically move your files to EFS-IA based on the last access time

* Enable EFS-IA with a Lifecycle Policy

* Example: move files that are not accessed for 60 days to EFS-IA

* Transparent to the applications accessing EFS

<br>

### EC2 Instance Store

#### What is EC2 Instance Store?

* EBS volumes are network drives with good but "limited" performance

* If you need a high-performance hardware disk, use EC2 Instance Store

* Better I/O performance

* EC2 Instance Store lose their storage if they're stopped (ephemeral)

* Good for buffer / cache / scratch data / temporary content

* Risk of data loss if hardware fails

* Backups and Replication are your responsibility

<br>

### FSx

* Fully managed service

* Launch 3rd party high-performance file systems on AWS

    * FSx for Windows File Server
    
    * FSx for Lustre

        * For High Performance Computing (HPC)
    
        * The name Lustre is derived from “Linux” and “cluster”
    
    * FSx for NetApp ONTAP

<br>
<br>
<br>
<br>
<br>
<br>

## AMI

### AMI Overview

* AMI = Amazon Machine Image

* AMI are a customization of an EC2 instance

* You add your own software, configuration, operating system, monitoring…

* Faster boot / configuration time because all your software is pre-packaged

* AMI are built for a specific region (and can be copied across regions)

* You can launch EC2 instances from:

* A Public AMI: AWS provided

* Your own AMI: you make and maintain them yourself

* An AWS Marketplace AMI: an AMI someone else made (and potentially sells)

<br>

### AMI Process (from an EC2 instance)

* Start an EC2 instance and customize it

* Stop the instance (for data integrity)

* Build an AMI – this will also create EBS snapshots

* Launch instances from other AMIs

<br>

### EC2 Image Builder

* Used to automate the creation of Virtual Machines or container images

* => Automate the creation, maintain, validate and test EC2 AMIs

* Can be run on a schedule (weekly, whenever packages are updated, etc…)

* Free service (only pay for the underlying resources)

<br>
<br>
<br>
<br>
<br>
<br>

## ELB & ASG

### ELB (Elastic Load Balancing)

#### Overview

* Load balancers are servers that forward internet traffic to multiple servers (EC2 Instances) downstream.

* An ELB (Elastic Load Balancer) is a managed load balancer

    * AWS guarantees that it will be working
    
    * AWS takes care of upgrades, maintenance, high availability
    
    * AWS provides only a few configuration knobs

* It costs less to setup your own load balancer but it will be a lot more effort on your end (maintenance, integrations)

* 3 kinds of load balancers offered by AWS:

    * Application Load Balancer (HTTP / HTTPS only) – Layer 7

    * Network Load Balancer (ultra-high performance, allows for TCP) – Layer 4

    * Gateway Load Balancer – Layer 3

<br>

### ASG (Auto Scaling Group)

#### Overview

* The goal of an Auto Scaling Group (ASG) is to:

    * Scale out (add EC2 instances) to match an increased load

    * Scale in (remove EC2 instances) to match a decreased load

    * Ensure we have a minimum and a maximum number of machines running

    * Automatically register new instances to a load balancer

    * Replace unhealthy instances

<br>

#### Scaling Strategies

* **Manual Scaling**: Update the size of an ASG manually

* **Dynamic Scaling**: Respond to changing demand

    * Simple / Step Scaling
    
        * When a CloudWatch alarm is triggered (example CPU > 70%), then add 2 units
        
        * When a CloudWatch alarm is triggered (example CPU < 30%), then remove 1
    
    * Target Tracking Scaling
    
        * Example: I want the average ASG CPU to stay at around 40%
    
    * Scheduled Scaling
    
        * Anticipate a scaling based on known usage patterns
    
        * Example: increase the minimum capacity to 10 at 5 pm on Fridays

* **Predictive Scaling**: Uses Machine Learning to predict future traffic ahead of time
    
    * Automatically provisions the right number of EC2 instances in advance

<br>
<br>
<br>
<br>
<br>
<br>

# S3

### Buckets

* Amazon S3 allows people to store objects (files) in “buckets” (directories)

* Buckets must have a globally unique name (across all regions all accounts)

* Buckets are defined at the region level

* S3 looks like a global service but buckets are created in a region

* Naming convention

    * No uppercase, No underscore
    
    * 3-63 characters long
    
    * Not an IP
    
    * Must start with lowercase letter or number
    
    * Must NOT start with the prefix `xn--`
    
    * Must NOT end with the suffix `-s3alias`

<br>

### Objects

* Objects (files) have a Key

* The key is the FULL path:

    * s3://my-bucket/`my_file.txt`
    
    * s3://my-bucket/`my_folder1/another_folder/my_file.txt`

* The key is composed of `prefix` + object name

* s3://my-bucket/`my_folder1/another_folder/`my_file.txt

* There’s no concept of “directories” within buckets (although the UI will trick you to think otherwise)

* Just keys with very long names that contain slashes (“/”)

* Object values are the content of the body:

    * Max. Object Size is 5TB (5000GB)
    
    * If uploading more than 5GB, must use “multi-part upload”

* Metadata (list of text key / value pairs) – system or user metadata

* Tags (Unicode key / value pair – up to 10) – useful for security / lifecycle

* Version ID (if versioning is enabled)

<br>

### Bucket Policies

* JSON based policies

    * Resources: buckets and objects
    
    * Effect: Allow / Deny
    
    * Actions: Set of API to Allow or Deny
    
    * Principal: The account or user to apply the policy to

* Use S3 bucket for policy to:

    * Grant public access to the bucket
    
    * Force objects to be encrypted at upload
    
    * Grant access to another account (Cross Account)

<br>

### Security

* User-Based

    * IAM Policies – which API calls should be allowed for a specific user from IAM

* Resource-Based

    * Bucket Policies – bucket wide rules from the S3 console - allows cross account
    
    * Object Access Control List (ACL) – finer grain (can be disabled)
    
    * Bucket Access Control List (ACL) – less common (can be disabled)

* An IAM principal can access an S3 object if:

    * The user IAM permissions ALLOW it OR the resource policy ALLOWS it
    
    * AND there’s no explicit DENY

* Examples:

    * `Anonymous www website visitor --> S3 Bucket`: S3 Bucket Policy
    
    * `IAM User --> S3 Bucket`: IAM Policy
    
    * `EC2 Instance --> S3 Bucket`: IAM Roles
    
    * `Other AWS account IAM User --> S3 Bucket`: S3 Bucket Policy

<br>

### Static Website Hosting

* S3 can host static websites and have them accessible on the Internet

* The website URL will be (depending on the region):

	* http://bucket-name.s3-website-aws-region.amazonaws.com, OR

	* http://bucket-name.s3-website.aws-region.amazonaws.com

* If you get a 403 Forbidden error, make sure the bucket policy allows public reads!

<br>

### Versioning

* You can version your files in Amazon S3

* It is enabled at the bucket level

* Same key overwrite will change the “version”: 1, 2, 3….

* It is best practice to version your buckets

    * Protect against unintended deletes (ability to restore a version)
    
    * Easy roll back to previous version

* Notes:

    * Any file that is not versioned prior to enabling versioning will have version “null”
    
    * Suspending versioning does not delete the previous versions

<br>

### Replication

* Cross-Region Replication (CRR)

* Same-Region Replication (SRR)

* Buckets can be in different AWS accounts

* Copying is asynchronous

* Must give proper IAM permissions to S3

* Must enable Versioning in source and destination buckets

<br>

### Storage Classes

#### Standard - General Purpose

* Used for frequently accessed data

* Low latency and high throughput

<br>

#### Infrequent Access

* For data that is less frequently accessed, but requires rapid access when needed

* Lower cost than S3 Standard

    * Standard - Infrequent Access
        
        * 99.9% Availability
    
    * One Zone - Infrequent Access
    
        * High durability (99.999999999%) in a single AZ
    
        * Data lost when AZ is destroyed

<br>

#### Glacier

* Low-cost object storage meant for archiving / backup
    
    * Instant Retrieval
    
        * Millisecond retrieval, great for data accessed once a quarter
    
        * Minimum storage duration of 90 days
    
    * Flexible Retrieval
    
        * Expedited (1 to 5 minutes), Standard (3 to 5 hours), Bulk (5 to 12 hours) – free
    
        * Minimum storage duration of 90 days
    
    * Deep Archive
    
        * For long term storage
    
        * Standard (12 hours), Bulk (48 hours)
    
        * Minimum storage duration of 180 days

<br>

#### Express One Zone

* High performance, single Availability Zone storage class
    
* Handle 100,000s requests per second with single-digit millisecond latency
    
* Up to 10x better performance than S3 Standard (50% lower costs)
    
* High Durability (99.999999999%) and Availability (99.95%)
    
* Co-locate your storage and compute resources in the same AZ (reduces latency)
    
* Use cases: latency-sensitive apps, data-intensive apps, AI & ML training, financial modeling, media processing, HPC…
    
* Best inteintegrated with SageMaker Model Training, Athena, EMR ..

<br>

#### Intelligent-Tiering

* Small monthly monitoring and auto-tiering fee

* Moves objects automatically between Access Tiers based on usage

    * Frequent Access tier (automatic): default tier
    
    * Infrequent Access tier (automatic): objects not accessed for 30 days
    
    * Archive Instant Access tier (automatic): objects not accessed for 90 days
    
    * Archive Access tier (optional): configurable from 90 days to 700+ days
    
    * Deep Archive Access tier (optional): config. from 180 days to 700+ days

<br>

### IAM Access Analyzer for S3

* Ensures that only intended people have access to your S3 buckets

* Example: publicly accessible bucket, bucket shared with other AWS account ...

* Evaluates S3 Bucket Policies, S3 ACLs, S3 Access Point Policies

<br>

### Snowball

#### Edge Computing

* Process data while it’s being created on an edge location

    * A truck on the road, a ship on the sea, a mining station underground ...

    * These locations may have limited internet and no access to computing power

<br>

#### What is Snowball?

* Highly-secure, portable and `offline` devices to collect and process data at the edge, and `migrate` data into and out of AWS

* Helps migrate up to Petabytes of data

* If it takes more than a week to transfer over the network, use Snowball devices!

<br>

### Storage Gateway

* Bridge between on-premise data and cloud data in S3

* Extend on-premises storage to S3

* Hybrid storage service to allow on-premises to seamlessly use the AWS

<br>
<br>
<br>
<br>
<br>
<br>

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

<br>
<br>
<br>
<br>
<br>
<br>

# Other Compute

## ECS (Elastic Container Service)

* Fully managed container orchestration service

* Launch Docker containers on AWS

* Enables teams to build, manage, and run even the most demanding containerized workloads without the complexity of infrastructure management

* You must provision & maintain the infrastructure (the EC2 instances)

* AWS takes care of starting / stopping containers

* You pay for AWS resources (for example, Amazon Elastic Compute Cloud [Amazon EC2] instances or Amazon Elastic Block Store [Amazon EBS] volumes) you create to store and run your application.

* You only pay for what you use, as you use it; there are no minimum fees and no upfront commitments

<br>

## Fargate

* Serverless compute for containers

* You do not provision the infrastructure (no EC2 instances to manage) – simpler!

* You pay for the amount of vCPU, memory, and storage resources consumed by your containerized applications running on Amazon Elastic Container Service (ECS) or Amazon Elastic Kubernetes Service (EKS)

<br>

## ECR (Elastic Container Registry)

* Fully managed container registry on AWS

* This is where you store your Docker images so they can be run by ECS or Fargate

<br>

## EKS (Elastic Kubernetes Service)

* Kubernetes is an open-source system for management, deployment, and scaling of containerized apps (Docker)

* Build, run, and scale production-ready applications easily across any environment

* Allows you to launch managed Kubernetes clusters on AWS

* Containers can be hosted on:

    * EC2 instances

    * Fargate (Serverless)

<br>

## API Gateway

* Fully managed, serverless service for developers to easily create, publish, maintain, monitor, and secure APIs

* Using API Gateway, you can create RESTful APIs and WebSocket APIs that enable real-time two-way communication applications.

* You pay for the API calls you receive and the amount of data transferred out

<br>

## Lambda

* Run code without thinking about servers or clusters

* Event-Driven: functions get invoked by AWS when needed

* Pay per request and compute time

<br>

## Batch

* Fully managed batch processing at any scale

* Efficiently run 100,000s of computing batch jobs on AWS

* A “batch” job is a job with a start and an end (opposed to continuous)

* Batch will dynamically launch EC2 instances or Spot Instances

* AWS Batch provisions the right amount of compute / memory

* You submit or schedule batch jobs and AWS Batch does the rest!

* Batch jobs are defined as Docker images and run on ECS

* Helpful for cost optimizations and focusing less on the infrastructure

<br>

## Batch vs Lambda

* Lambda:

    * Time limit

    * Limited runtimes

    * Limited temporary disk space

    * Serverless

* Batch:

    * No time limit

    * Any runtime as long as it’s packaged as a Docker image

    * Rely on EBS / instance store for disk space

    * Relies on EC2 (can be managed by AWS)

<br>

## Lightsail

* Build applications and websites fast with low-cost, pre-configured cloud resources

* Pre-configured development stacks like LAMP, Nginx, MEAN, and Node.js. to get online quickly and easily

* Build and personalize your blog, ecommerce, or personal website in just a few clicks, with pre-configured applications like WordPress, Magento, Prestashop, and Joomla

* Great for people with little cloud experience!

* Has high availability but no auto-scaling, limited AWS integrations

<br>
<br>
<br>


Sources:
- [Link](https://gale.udemy.com/course/aws-certified-cloud-practitioner-new)
- [Link](https://media.datacumulus.com/aws-ccp/AWS%20Certified%20Cloud%20Practitioner%20Slides%20v41.pdf)

