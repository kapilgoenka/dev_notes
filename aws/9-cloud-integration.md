# Cloud Integration

## SQS (Simple Queue Service)

* Fully managed message queuing service

* Use to decouple applications

* Send, store, and receive messages between software components at any volume

* Default retention of messages: 4 days, maximum of 14 days

* Consumers share the work to read messages & scale horizontally

<br>

## Kinesis

* Family of four distinct tools used to collect, process, and analyze real-time video and data streams.

    * <u>Kinesis Data Streams</u>: Ingest data at scale from hundreds of thousands of sources
    
    * <u>Kinesis Data Firehose</u>: Load data stream into Amazon S3, Redshift, OpenSearch, etc
    
    * <u>Kinesis Data Analytics</u>: Runs a SQL query on data stream in real-time
    
    * <u>Kinesis Video Streams</u>: Instead of data text, it streams live video feeds (e.g., from Dashcams or Security Cameras) into AWS

* A mental simulation to understand Amazon Kinesis

    * 🏁 The Setup

        * Imagine you are the Lead Architect for a massive ride-sharing app (like Uber or Lyft). You need to track millions of cars and passengers simultaneously to make split-second decisions.

        * The Source: 100,000 cars driving around a city.
    
        * The Data: Every car generates a GPS coordinate, speed, and passenger status every second.
    
        * The Goal: Calculate "Surge Pricing" (high demand areas) and store the data for history logs.

    * We will simulate two scenarios to handle this data:

        * The "Batch" Era (The Old Way)
    
        * The "Streaming" Era (The Kinesis Way)

    * 🔴 Scenario A: The "Batch" Approach (The Old Way)

        * In the old world, data was treated like mail. It was collected, piled up, and processed in bulk.
    
            * Collection: Cars save their GPS data locally on the phone.
        
            * Upload: Once every hour (or when the driver ends a shift), the app uploads a giant CSV file to your servers.
        
            * Processing: At 12:00 AM every night, your servers wake up, crunch all the files, and update your dashboards.
        
            * Simulation Outcome:
        
                * Latency: Massive. You don't know a specific street is busy until tomorrow.
            
                * Business Impact: You cannot turn on "Surge Pricing" when the concert lets out because you won't know about the crowd until the drivers upload their logs hours later.

    * 🟢 Scenario B: The Kinesis Approach (Real-Time Streaming)

        * In the Kinesis world, data is treated like water in a pipe. It flows continuously.

            * Step 1: Kinesis Data Streams (The "High-Speed Pipe")

                * Every car sends its GPS "dot" immediately—sub-second latency.
            
                * Action: 100,000 cars fire tiny JSON packets ("I am here") into Kinesis Data Streams.
            
                * The Magic: This service is the "highway" that catches millions of tiny packets per second without crashing. It doesn't process them; it just catches them and holds them for a few hours/days so other tools can grab them.

            * Step 2: Kinesis Data Analytics (The "Brain")

                * Action: You attach a "Brain" to the "Pipe."
            
                * The Logic: This service looks at the flowing water (the data stream) in real-time. It runs a SQL query like: "If more than 500 cars are in Grid Zone A right now, trigger an alert."
            
                * Result: The system detects the crowd at the concert venue within seconds and instantly updates the app to show "2x Surge Pricing."

            * Step 3: Kinesis Data Firehose (The "Archivist")

                * You still need to save this data for long-term history, but you don't want to write code to do it.
            
                * Action: You connect Firehose to the Stream.
            
                * The Job: Firehose acts like a bucket brigade. It collects the streaming data, waits until it has a decent amount (e.g., 5MB or 60 seconds worth), compresses it, and dumps it into Amazon S3 (storage) or Redshift (database).
            
                * Result: You have a perfect historical record of every trip without writing a single line of "save to database" code.

* Video: [Introduction to Amazon Kinesis](https://www.youtube.com/watch?v=MbEfiX4sMXc)

<br>

## SNS

* Event-driven computing

    * A model in which subscriber services automatically perform work in response to events triggered by publisher services

    * This paradigm can be applied to automate workflows while decoupling the services that collectively and independently work to fulfill these workflows

* Amazon SNS is an event-driven hub that has native integration with a wide variety of AWS event sources and event destinations

* Fully managed Pub/Sub service for Application-to-application (A2A) and Application-to-person (A2P) messaging

    * A2A use case: integrate and decouple distributed applications
    
    * A2P use case: distribute notifications to your customers with SMS texts, push notifications, and email

* Topic types

    * Standard Topics

        * When your application can process messages that arrive more than once and out of order

    * FIFO Topics

        * When order of operations and events is critical, or where duplicates can't be tolerated

<br>

## Amazon MQ

* SQS, SNS are “cloud-native” services: proprietary protocols from AWS

* Traditional applications running from on-premises may use open protocols such as: MQTT, AMQP, STOMP, Openwire, WSS

* When migrating to the cloud, instead of re-engineering the application to use SQS and SNS, we can use Amazon MQ

* Think of Amazon MQ as a "Translator" service. AWS realizes that companies have decades of software written for ActiveMQ or RabbitMQ. Instead of forcing you to rewrite that software, AWS runs those brokers for you so you can move to the cloud without changing your code.

* Amazon MQ is a managed message broker service for RabbitMQ and ActiveMQ

* Amazon MQ doesn’t “scale” as much as SQS / SNS

* Amazon MQ runs on servers, can run in Multi-AZ with failover

* Amazon MQ has both queue feature (~SQS) and topic features (~SNS)

* Simulation to understand Amazon MQ

    * Imagine you are the IT Director for a large, traditional logistics company that has been running its own on-premise data center for 15 years. You are finally moving to the cloud (AWS).
    
    * We will simulate two ways to move your messaging infrastructure (the system that lets your warehouse servers talk to your billing servers):
    
        * The "Cloud-Native" Way (SQS/SNS)
        
        * The "Lift-and-Shift" Way (Amazon MQ)
    
    * 🏁 The Setup
    
        * The Legacy App: You have a 10-year-old billing application written in Java.
        
        * The Language: It speaks a specific messaging language called JMS (Java Message Service) or AMQP.
        
        * The Code: The code is millions of lines long, and the developers who wrote it left the company 5 years ago. No one wants to touch it.
    
    * 🔴 Scenario A: The "Cloud-Native" Way (Refitting)
    
        * You decide to use Amazon SQS (Simple Queue Service) because you heard it's infinitely scalable.
        
        * The Clash: You try to connect your old Java billing app to SQS.
        
        * The Problem: The app speaks AMQP/JMS, but SQS only speaks AWS API (HTTP/REST). They are speaking different languages.
        
        * The Solution: You have to hire a team of developers to rewrite the code in your billing app to rip out the old messaging logic and replace it with the AWS SDK.
        
        * The Risk: Rewriting old code creates bugs. The migration takes 6 months.
        
        * Simulation Status:
        
            * Effort: High (Expensive code rewrite).
            
            * Risk: High (Breaking legacy features).
    
    * 🟢 Scenario B: The Amazon MQ Way (Lift-and-Shift)
    
        * You decide to use Amazon MQ.
        
        * The Setup: You click a button in AWS to launch an Amazon MQ broker (which is just a managed version of ActiveMQ or RabbitMQ—software you were already using on-premise).
        
        * The Switch: You go into your old Java billing app's configuration file. You find the line that says broker_url=192.168.0.5 (your old server) and change it to broker_url=mq.us-east-1.amazonaws.com (the new AWS endpoint).
        
        * The Result: The application connects immediately. It realizes the new server speaks the exact same language (AMQP/JMS). It starts sending data instantly.
        
        * Simulation Status:
        
            * Effort: Low (Config change only).
            
            * Risk: Zero (No code changes).
    
    * 🧩 The Core Distinction
    
        * Why wouldn't you always use Amazon MQ?
        
            * Amazon MQ is like a Private Parking Garage. It is familiar and compatible, but it has a limit. If you try to park 10,000 cars (messages) at once, you will fill up the garage and the server might crash or slow down. You have to choose the garage size (Instance Type).
            
            * Amazon SQS is like a Public Highway. It doesn't care if you drive 1 car or 1,000,000 cars. It expands infinitely. But you can't just drive a train (legacy protocol) on it; you need a street-legal car (AWS SDK).