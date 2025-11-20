# Global Applications

## Route 53

* Provides Domain Name System (DNS), domain name registration, and health-checking cloud services

* Route end users to internet applications by translating names like example.com into the numeric IP addresses, such as 192.0.2.1

* Combine your Route 53 DNS with health-checking services to route traffic to healthy endpoints or to independently monitor and alarm on endpoints.

* Routing Policies

    * Simple Routing Policy
    
    * Weighted Routing Policy

    * Latency Routing Policy

    * Failover Routing Policy

<br>

## CloudFront

* Content Delivery Network (CDN)

* Delives data through 700+ globally dispersed Points of Presence (PoPs)

* Improves read performance, content is cached at the edge

* CloudFront edge locations seamlessly connected to AWS Regions through the fully redundant AWS network backbone

* CloudFront has three types of infrastructure

    * Regional Edge Caches (RECs)
    
        * Situated within AWS Regions
        
        * Between your applications’ web server and CloudFront Points of Presence (POPs) and embedded Points of Presence.
    
    * Points of Presence
    
        * Situated within the AWS network
        
        * Peer with internet service provider (ISP) networks
    
    * Embedded Points of Presence
    
        * Situated within internet service provider (ISP) networks
        
        * Closest to end viewers


* If AWS origins such as Amazon S3, Amazon EC2 or Elastic Load Balancing are used, there is no charge incurred for data transferred from origins to CloudFront Edge locations (this type of data transfer is known as origin fetch).

* CloudFront vs Cross Region Replication

    * CloudFront
    
        * Global Edge network
        
        * Files are cached for a TTL (maybe a day)
        
        * Great for static content that must be available everywhere
    
    * Cross Region Replication
    
        * Must be setup for each region you want replication to happen
        
        * Files are updated in near real-time
        
        * Great for dynamic content that needs to be available at low-latency in few regions

<br>

## S3 Transfer Acceleration

* Speed up content transfers to and from Amazon S3 by as much as 50-500% for long-distance transfer of larger objects

* Reduces the variability in Internet routing, congestion and speeds that can affect transfers, and logically shortens the distance to S3 for remote applications

* Improves transfer performance by routing traffic through Amazon CloudFront’s globally distributed Edge Locations and over AWS backbone networks

<br>

## S3 Transfer Acceleration vs AWS Global Accelerator

* Similarity

    * Both use the AWS Global Network (the private fiber backbone) to bypass the public internet

* Differences

    * **Destination**

        * AWS Global Accelerator

            * For Application Traffic.

            * Designed to get users to your *Compute* (EC2 instances, Load Balancers) faster.

            * Points to a "listener" on a server or load balancer.
    
        * S3 Transfer Acceleration

            * For Object Storage.

            * Designed solely to get files into or out of a specific S3 Bucket faster.

            * Points directly to a single S3 Bucket.

    * **Entry Point**

        * AWS Global Accelerator

            * Gives you two static Anycast IP addresses (e.g., 1.2.3.4 and 7.8.9.10).

            * You hardcode these into your client software or DNS.
 
         * S3 Transfer Acceleration

            * Gives you a special domain name (e.g., my-bucket.s3-accelerate.amazonaws.com)

            * You must change your application to use this specific URL endpoint instead of the standard S3 endpoint

    * **Entry into AWS Global Network**
    
       * AWS Global Accelerator
    
            * Uses Anycast. The static IP exists at every edge location simultaneously. The user connects to the closest one, and the connection is proxied to your server.
    
        * S3 Transfer Acceleration
    
            * Uses CloudFront Edge Locations. When a user uploads a file to the accelerated endpoint, it hits the nearest CloudFront Edge location, which then carries the file over the AWS private network to the S3 bucket.

<br>

## AWS Outposts

* Run AWS infrastructure and services on premises 

* A family of fully managed solutions delivering AWS infrastructure and services to virtually any on-premises or edge location

* Outposts solutions allow you to extend and run native AWS services on premises

* Outposts racks provide AWS compute, storage, database, and other services locally, while still allowing you to access the full range of AWS services available in the Region for a truly consistent hybrid experience.

* Benefits:

    * Low-latency access to on-premises systems

    * Local data processing

    * Data residency

    * Easier migration from on-premises to the cloud

    * Fully managed service

<br>

## AWS Wavelength

* Run applications using AWS Infrastructure and services in AWS telco partners’ data centers

* A multi-tenant service providing AWS infrastructure and services hosted within a trusted telco facility.

* Brings AWS services to the edge of the 5G networks

* Ultra-low latency applications through 5G networks

* Traffic doesn’t leave the Communication Service Provider’s (CSP) network

<br>

## AWS Local Zones

* Run applications on AWS infrastructure closer to your end users and workloads

* Extend AWS services to metro areas across world to run latency-sensitive applications closer to your users

* A type of AWS infrastructure deployment that place compute, storage, database, and other select services closer to large population

* Enables delivering applications that require single-digit millisecond latency to end users

* Extend your VPC to more locations