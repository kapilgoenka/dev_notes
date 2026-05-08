# VPC

## IP Addresses in AWS

* IPv4 – Internet Protocol version 4

    * 4.3 Billion Addresses

    * Public IPv4 – can be used on the Internet

    * Private IPv4 – can be used on private networks (LAN) such as internal AWS networking (e.g., 192.168.1.1)

    * Every EC2 instance gets a new a public IP address every time you stop then start it (default)

    * Private IPv4 is fixed for EC2 Instances even if you start/stop them

    * Elastic IP – allows you to attach a fixed public IPv4 address to EC2 instance

    * Note: all public IPv4 on AWS will be charged $0.005 per hour (including EIP)

* IPv6 – Internet Protocol version 6

    * 3.4 × 10!" Addresses

    * Every IP address is public in AWS (no private range)

    * Example: 2001:db8:3333:4444:cccc:dddd:eeee:ffff

    * Free

<br>

## Terminology

* VPC - A logically isolated virtual network in the AWS cloud. Region-Scoped.
    
* Subnet - A range of IP addresses in your VPC. AZ-Scoped.
    
* Route Table - Rules that determine where network traffic is directed.
    
* Internet Gateway - The door that connects your VPC to the public internet.
    
* NAT Gateway - A device in a public subnet that lets private instances talk to the internet, but stops the internet from talking to them.
    
* NACL - A firewall that controls traffic entering/leaving a subnet.
    
* Security Group - A firewall that controls traffic entering/leaving a specific instance (server).

<br>

## Public vs Private subnet

* The difference between a Public and Private subnet is not a physical switch. It is purely based on Routing.
    
    * Public Subnet = Has a Route Table entry pointing to the Internet Gateway.
    
    * Private Subnet = Does not have a Route to the Internet Gateway (but might route to a NAT Gateway).

<br>

## VPC Peering

* Connect two VPC, privately using AWS’ network

* Make them behave as if they were in the same network

* VPC Peering connection is not transitive (must be established for each VPC that need to communicate with one another)

* Must not have overlapping CIDR (IP address range)

<br>

## VPC Endpoints

* Peering with services instead of other VPCs

* This is how you connect your VPC to AWS services (like S3 or DynamoDB) or third-party SaaS tools without ever leaving your private network.

* Two Flavors of Endpoints:

    * VPC Endpoint Gateway: For S3 & DynamoDB
    
    * VPC Endpoint Interface (aka PrivateLink): For most services (including S3 & DynamoDB)

<br>

## Site-to-Site VPN & Direct Connect

* Site-to-Site VPN

    * Extend your on-premises networks to the cloud

    * Fully-managed service that creates a secure connection between your data center or branch office and your AWS resources using IP Security (IPSec) tunnels

* Direct Connect

    * Create a dedicated network connection to AWS.

    * The AWS Direct Connect cloud service is the shortest path to your AWS resources.

    * While in transit, your network traffic remains on the AWS global network and never touches the public internet.


* Head-to-Head Comparison

    | Feature | Site-to-Site VPN  | AWS Direct Connect (DX) |
    |---|---|---|
    | Analogy | Armored Truck on Public Highway | Private Underground Train |
    | Network | Runs over the Public Internet | Runs over Dedicated Fiber Lines |
    | Latency | Variable (Jittery)| Consistent (Low Latency) |
    | Setup Time | Minutes (Software config) | Weeks (Physical cabling) |
    | Throughput | Limited (Max 1.25 Gbps per tunnel) | Massive (1 Gbps to 100 Gbps) |
    | Best For | Startups, Small Offices | Banks, Government, Big Data, Real-time voice/video |

<br>

## AWS Client VPN

* Connects People, not Buildings

    * This is the main difference from Site-to-Site VPN.
    
        * Site-to-Site VPN: Connects Office Router ↔ AWS. (Good for 500 people sitting in the HQ).
        
        * Client VPN: Connects Laptop ↔ AWS. (Good for 1 person sitting in a hotel).

* AWS secretly creates a network interface (ENI) inside your VPC subnets. It acts as a "proxy" or "landing pad". Traffic from AWS Client VPN hits the AWS VPN Endpoint, which routes it through this ENI to reach your private servers.

<br>

## AWS Transit Gateway

* VPC Peering
    
    * Handshake between two neighbors

    * Doen not allow transitive routing

* Transit Gateway

    * Post Office for the entire country

    * Allows transitive routing

* Hub and Spoke architecture

    * Hub: The Transit Gateway.
    
    * Spokes: Your VPCs, VPNs, and Direct Connects

* The VPN Concentrator feature:

    * Without TGW: If you have 10 VPCs and 1 Corporate Office (VPN), you have to set up 10 separate VPN connections (one for each VPC). If the office router IP changes, you have to update 10 configurations.
    
    * With TGW: You set up 1 VPN connection from your Office to the Transit Gateway. Because the TGW is connected to all 10 VPCs, your Office instantly has access to all of them. You manage 1 VPN instead of 10.