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