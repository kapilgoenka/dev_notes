# Deploying and Managing Infrastructure at Scale

## CloudFormation

* Declarative way of outlining your AWS Infrastructure

* Infrastructure as code

    * No resources manually created, which is excellent for control
    
    * Changes to the infrastructure reviewed through code

* For example, within a CloudFormation template, you say:

    * I want a security group

    * I want two EC2 instances using this security group

    * I want an S3 bucket

    * I want a load balancer (ELB) in front of these machines

* Then CloudFormation creates those for you, in the right order, with the exact configuration that you specify

* Productivity

    * Ability to destroy and re-create an infrastructure on the fly
    
    * Automated generation of Diagram for your templates
    
    * Declarative programming (no need to figure out ordering and orchestration)
    
    * Leverage existing templates on the web
    
* Infrastructure Composer: UI

<br>

## Cloud Development Kit (CDK)

* Define your cloud infrastructure using a familiar language
    
* The code is “compiled” into a CloudFormation template (JSON/YAML)
    
* Deploy infrastructure and application runtime code together
    
    * Great for Lambda functions
    
    * Great for Docker containers in ECS / EKS

<br>

## Elastic Beanstalk

* Platform as a Service (PaaS)

* Fastest way to get web applications up and running on AWS

* Developer centric view of deploying an application on AWS

* You simply upload your application code, and the service automatically handles details such as resource provisioning, load balancing, auto scaling, and monitoring.

* Ideal if you have a PHP, Java, Python, Ruby, Node.js, .NET, Go, or Docker web application

* Uses core AWS services such as EC2, ASG, ELB, RDS etc to support applications that need to scale to serve millions of users

* Beanstalk is free but you pay for the underlying instances

* Managed service

    * Instance configuration / OS is handled by Beanstalk

    * Deployment strategy is configurable but performed by Elastic Beanstalk

    * Capacity provisioning

    * Load balancing & auto-scaling

    * Application health-monitoring & responsiveness

* Three architecture models:

    * Single Instance deployment: good for dev

    * LB + ASG: great for production or pre-production web applications

    * ASG only: great for non-web apps in production (workers, etc..)

* Health Monitoring

    * Health agent pushes metrics to CloudWatch
    
    * Checks for app health, publishes health events

<br>

## CodeDeploy

* Automates application deployments to a variety of compute services including EC2, Fargate, Lambda, and on-premises instances.

* Fully automates application deployments, removing the need for manual operations

* Protects your application from downtime during deployments through rolling updates and deployment health tracking

* Tracks and stores the recent history of your deployments, so you can investigate the timeline and change history of past deployments

<br>

## CodeBuild

* Fully managed continuous integration service

* You specify the location of your source code and choose your build settings

* CodeBuild will run build scripts for compiling, testing, and packaging your code

* Produces packages that are ready to be deployed (by CodeDeploy for example)

* No servers to provision and scale or software to install, configure, and operate

* Pay-as-you-go pricing – only pay for the build time

<br>

## CodePipeline

* Automate continuous delivery pipelines for fast and reliable updates

* Model your software release process and mitigate the need to set up or provision servers

<br>

## CodeArtifact

* Fully managed artifact repository service

* Store, publish, and share software packages

* Works with existing package managers such as npm, pip

* Publish packages developed within your organization

* Integrates with IAM and CloudTrail, offering control over who can access software packages

<br>

## AWS Systems Manager

* Manage nodes at scale on AWS and in multicloud and hybrid environments

* Offers comprehensive visibility and control across your entire infrastructure, including across AWS accounts, Regions, and AWS Organizations.

* Most important features are:

    * Patching automation for enhanced compliance

    * Run commands across an entire fleet of servers

    * Store parameter configuration with the SSM Parameter Store

* How it works:

    * We need to install an SSM agent on the systems we control
    
    * Installed by default on Amazon Linux AMI & some Ubuntu AMI
    
    * Thanks to the SSM agent, we can run commands, patch & configure our servers