# Security & Compliance

## Shield Standard

* Free service that is activated for every AWS customer.

* Good against "brute force" network attacks (SYN Floods, UDP Floods).

* Can't stop "smart" attacks that look like real user behavior.

* Shield Standard is famous for blocking UDP Reflection Attacks.

    * The Attack: A hacker pretends to be you and yells at a third party (like a DNS server). The third party yells back a huge answer at you.
    
    * The Result: You get crushed by data you didn't ask for.
    
    * The Shield: AWS absorbs this massive bandwidth on their global backbone so your little EC2 instance never even feels it.

## Shield Advanced

* Optional DDoS mitigation service ($3,000 per month per organization)

* Full coverage against "smart" application attacks.

* "Bill Insurance" against attack-related spikes.

<br>

## Web Application Firewall

* Protects your web applications from common web exploits

* Layer 7: HTTP

* You attach WAF to Entry Points only:

    * Application Load Balancer (ALB)
    
    * Amazon CloudFront (CDN)
    
    * API Gateway
    
    * AppSync (GraphQL)

* You cannot attach WAF directly to an EC2 instance. It sits in front of them.

* To master WAF, you need to understand these three layers of hierarchy

    | Component     | The Analogy           | Technical Definition                                                                                                                                    |
    |---------------|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Web ACL       | The Rulebook          | The master policy attached to your resource (ALB, CloudFront, API Gateway).                                                                             |
    | Rules         | Specific Instructions | "Block anyone wearing red shoes" (Block traffic from Country X) or "Block anyone carrying a knife" (Block XSS patterns).                                |
    | Managed Rules | Hired Consultants     | You don't know what every knife looks like. So you buy a "Managed Rule Set" from AWS or a partner that already knows 5,000 types of weapons to look for |
    
<br>

## AWS Network Firewall

* Customs & Border Control for the entire city (VPC)

* Protect your entire Amazon VPC. 

* From Layer 3 to Layer 7 protection.

* ⚔️ Head-to-Head: WAF vs. Network Firewall

    * AWS WAF is for Web Apps (HTTP/HTTPS). It understands "SQL Injection" and "Cross-Site Scripting." It protects your Website.
    
    * AWS Network Firewall is for Everything Else. It understands "SSH," "FTP," "RDP," and non-web protocols. It protects your Network.

* To use AWS Network Firewall:

    * You must create a Firewall Subnet
    
    * You must change your Route Tables to force traffic to go through that subnet

<br>

AWS Firewall Manager

* 🧩 What does it actually manage?

    * Firewall Manager is not a "firewall" itself; it is a Remote Control for other firewalls. It can control:
    
        * AWS WAF: (e.g., "Apply this rule to every ALB").
        
        * AWS Shield Advanced: (e.g., "Turn on DDoS protection for every Elastic IP").
        
        * VPC Security Groups: (e.g., "Audit all groups and alert me if anyone opens Port 22 to the world").
        
        * AWS Network Firewall: (e.g., "Deploy a Network Firewall in every VPC").
        
        * Route 53 Resolver DNS Firewall: (e.g., "Block domains ending in .evil across the company").

* ⚡ The "Prerequisites" (The Barrier to Entry)

    * You cannot just turn this on. Because it works across your entire company, it requires:
    
        * AWS Organizations: You must have all your accounts linked in a hierarchy.
        
        * AWS Config: This is the service that "scans" your accounts to find the resources (like Load Balancers) so Firewall Manager knows where to apply the rules.

<br>

## AWS KMS (Key Management Service)

* Create and control keys used to encrypt or digitally sign your data

* AWS Managed vs. Customer Managed Keys

    * AWS Managed Key (The Hotel Safe):
    
        * Pros: Free. Easy. AWS handles everything.
        
        * Cons: You don't own it. You cannot share this key with another AWS account. You cannot delete it.
    
    * Customer Managed Key (The Private Safe):
    
        * Pros: You have full control. You can rotate the key. You can share it with other accounts (e.g., "Production" account sharing a backup with "Disaster Recovery" account).
        
        * Cons: Cost (~$1/month + usage fees). You are responsible for managing the policy.