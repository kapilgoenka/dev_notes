# Cloud Monitoring

## CloudWatch

* Amazon CloudWatch is a monitoring and management service that provides data and actionable insights for AWS, on-premises, hybrid, and other cloud applications and infrastructure resources.

* You can collect and access all your performance and operational data in the form of logs and metrics from a single platform rather than monitoring them in silos (server, network, or database).

* CloudWatch enables you to monitor your complete stack (applications, infrastructure, network, and services) and use alarms, logs, and events data to take automated actions and reduce mean time to resolution (MTTR).

* CloudWatch Logs

    * Collect and store logs from your resources, applications, and services in near real time

    * CloudWatch Logs can collect log from:

        * Elastic Beanstalk: collection of logs from application

        * ECS: collection from containers

        * AWS Lambda: collection from function logs

        * CloudTrail based on filter

        * CloudWatch log agents: on EC2 machines or on-premises servers

        * Route53: Log DNS queries

    * CloudWatch Logs for EC2

        * By default, no logs from your EC2 instance will go to CloudWatch

        * You need to run a CloudWatch agent on EC2 to push the log files you want

        * Make sure IAM permissions are correct

* CloudWatch Alarms

    * Alarms are used to trigger notifications for any metric
    
    * Alarms actions…
    
        * Auto Scaling: increase or decrease EC2 instances “desired” count
    
        * EC2 Actions: stop, terminate, reboot or recover an EC2 instance
    
        * SNS notifications: send a notification into an SNS topic
    
    * Can choose the period on which to evaluate an alarm
    
    * Example: create a billing alarm on the CloudWatch Billing metric
    
    * Alarm States: OK. INSUFFICIENT_DATA, ALARM

<br>

## EventBridge

* EventBridge Pipes is a serverless integration resource that helps you build point-to-point integrations by providing a simpler and consistent way to integrate event producers with event consumers without writing additional code.

* SNS = dumb pipe, smart endpoints

* EventBridge = smart pipe, dumb endpoints

* Simulation to understand EventBridge

    * Imagine you are running a massive, chaotic International Airport.
    
    * We will simulate two ways to handle passengers (Data) arriving and needing to get to their connecting flights (Targets).
    
        * The "Loudspeaker" Method (SNS)
        
        * The "Smart Concierge" Method (EventBridge)
    
    * 🏁 The Setup
    
        * The Event: A passenger lands. This passenger is a "VIP" from "London" carrying "Gold" luggage.
        
        * The Goal: You need to route this specific passenger to the First Class Lounge, while sending regular passengers to the standard waiting area.
    
    * 🔴 Scenario A: The "Loudspeaker" Method (SNS)
    
        * This is how SNS works. It is a "dumb" megaphone.
        
        * Arrival: The passenger lands.
        
        * The Action: SNS gets on the loudspeaker and shouts to everyone working at the airport: "SOMEONE HAS LANDED!"
        
        * The Inefficiency:
        
            * The First Class Lounge hears it, checks the passenger, sees they are VIP, and lets them in.
            
            * The Baggage Handlers hear it, run over, realize they aren't needed yet, and leave.
            
            * The Janitors hear it and get annoyed.
            
            * The Problem: Everyone receives every message, even if they don't care. You have to write code in every receiving system to filter out the noise.
        
        * Simulation Status:
        
            * Efficiency: Low. Too much noise ("Fan-out").
            
            * Logic: The receivers have to be smart; the sender is dumb.
    
    * 🟢 Scenario B: The "Smart Concierge" Method (EventBridge)
    
        * This is how EventBridge works. It is a highly intelligent router.
        
        * Arrival: The passenger lands. They hand their ticket to the EventBridge Concierge (The Default Bus).
        
        * The Inspection (The "Rule"): The Concierge looks at the ticket (the JSON payload).
        
            * Rule 1: "Is the passenger from London?" Yes.
            
            * Rule 2: "Is the Status VIP?" Yes.
        
        * The Action: The Concierge quietly escorts only this specific passenger directly to the First Class Lounge.
        
        * The Result: The Baggage Handlers and Janitors never even knew the passenger arrived.
        
        * Simulation Status:
        
            * Efficiency: High. Zero noise.
            
            * Logic: The router is smart; the receivers can be dumb.
    
    * ⚡ The "Killer Feature": SaaS Integration
    
        * This is what makes EventBridge unique compared to everything else.
    
        * Imagine your company uses Salesforce, Shopify, or Zendesk.
        
        * Without EventBridge: You have to write a script that runs every 5 minutes to ask Shopify: "Do I have new orders? Do I have new orders?" (Polling).
        
        * With EventBridge: You just plug Shopify directly into your Event Bus.
        
        * The Magic: When a sale happens on Shopify, the event appears in your AWS account instantly without you writing a single line of code.
    
    * ⚔️ Head-to-Head: EventBridge vs. SNS
    
        * This is the most common confusion.
        
        * SNS is for Broadcasting. Use it when you want to tell everyone (Email + SMS + Lambda) that something happened. It is "dumb pipe, smart endpoints."
        
        * EventBridge is for Routing. Use it when you want to send specific events to specific places based on the data inside the event. It is "smart pipe, dumb endpoints."

<br>

## CloudTrail

* Provides governance, compliance and audit for your AWS Account

* Actions taken by a user, role, or an AWS service are recorded as events in CloudTrail.

* Events include actions taken in the the console, AWS Command Line Interface, and AWS SDKs and APIs.

* CloudTrail is enabled by default!

* Get an history of events / API calls made within your AWS Account by:

    * Console

    * SDK

    * CLI

    * AWS Services

* Can put logs from CloudTrail into CloudWatch Logs or S3

<br>

## X-Ray

* AWS X-Ray makes it easy for developers to analyze the behavior of their production, distributed applications with end-to-end tracing capabilities.

* AWS X-Ray provides an end-to-end, cross-service view of requests made to your application.

* You just integrate the X-Ray SDK with your application and install the X-Ray agent.

* With AWS Elastic Beanstalk, you only have to integrate the X-Ray SDK with your application since the X-Ray agent is pre-installed on Elastic Beanstalk.

* You can set the trace sampling rate that is best suited for your application

* ⚔️ Head-to-Head: CloudWatch vs. X-Ray

    * This is the most common confusion.
    
    * CloudWatch Logs tell you "What happened?" inside a specific server.
    
        * Example: "Error: Database connection failed on line 42."
    
    * X-Ray tells you "Where was it?" and "How long did it take?" across the whole system.
    
        * Example: "The request spent 200ms in Lambda, then waited 5000ms for DynamoDB to respond."
    
    * 💡 When to use X-Ray?
    
        * If you have a Monolith (one big server), X-Ray is useful but not critical. If you have Microservices (Lambda, API Gateway, DynamoDB, SQS all talking to each other), X-Ray is mandatory. Without it, debugging a slow request is nearly impossible.

<br>

## CodeGuru

* An ML-powered service for automated code reviews and application performance recommendations

* Provides two functionalities

    * CodeGuru Reviewer: automated code reviews for static code analysis (development)

    * CodeGuru Profiler: visibility/recommendations about application performance during runtime (production)

* Simulation to understand CodeGuru

    * 🏁 The Setup
    
        * The Code: You are building a new feature: "Upload 4K Video."
        
        * The Goal: Ensure the code doesn't have bugs (Reviewer) and doesn't crash the server when 10,000 people use it (Profiler).
    
    * 🔴 Scenario A: The "Manual" Method
    
        * You rely entirely on tired humans.
        
        * The Review (Before Launch): A Senior Developer, "Bob," reads your code. He is tired. He misses a line where you forgot to close a database connection. He approves the merge.
        
            * Result: A hidden "leak" enters the factory.
        
        * The Runtime (After Launch): You release the feature. It works for 5 users. But when 10,000 users upload videos, your servers freeze.
        
            * The Investigation: You stare at CPU graphs. You panic and buy bigger servers (wasting money). You guess the problem is the "Database," so you spend 2 weeks optimizing it.
            
            * The Reality: The problem was actually the "Image Resizer," but you had no way of knowing that.
        
        * Simulation Status:
        
            * Quality: Low (Bugs slipped through).
            
            * Cost: High (Wasted server money).
    
    * 🟢 Scenario B: The CodeGuru Method
    
        * You hire two AI robots: The Reviewer and The Profiler.
        
        * Robot 1: CodeGuru Reviewer (The Blueprint Inspector)
        
            * Action: You submit your code to GitHub.
            
            * The Magic: Before "Bob" even looks at it, CodeGuru scans the text. It has learned from millions of lines of Amazon's own code.
            
            * The Catch: It comments on Line 42: "Warning: You opened a file stream here but didn't close it. This is a resource leak."
            
            * The Fix: You fix the code immediately. The bug never even enters the main branch.
        
        * Robot 2: CodeGuru Profiler (The Efficiency Consultant)
        
            * Action: The app is now live. CodeGuru Profiler is running in the background (using an agent).
            
            * The Magic: It watches every single function in real-time. It notices that one specific function, compressVideo(), is using 80% of your CPU power but only doing 10% of the work.
            
            * The Insight: It tells you: "This specific line of code is expensive. If you change this library, you will reduce CPU usage by 50%."
            
            * The Fix: You optimize exactly that one line. You can now downgrade your servers and save money.
            
        * Simulation Status:
        
            * Quality: High (Clean code).
            
            * Cost: Low (Optimized servers).