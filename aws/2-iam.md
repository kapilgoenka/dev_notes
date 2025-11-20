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