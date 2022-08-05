# IAM
The IAM is responsible of the Identity management.

## Users
The IAM Users represent real life users such as people or tools. They can access through a password or an access key id and secret combination.

## Groups
They aggregate multiple users.

## Policies
They define the actions the user are allowed or forbidden to execute on specific resources/services. They are a JSON document that must respect a specific format.

## Roles
They are meant to give some AWS Services permissions to work with other aws services. For example CloudFormation is an AWS service that has its own role in order to create resources on the AWS cloud. They can be used also to give permissions to other aws accounts to manage services for the current account.

## Security Tools
Some utility tools for security

### IAM Credntials Report
Account-level tool that gives a report that lists all the account's users and the status of their various credentials

### IAM Access Advisord
User-level tool the shows the service permissions granted to a user and when those services were last accessed. Useful when there is the need to revise the policies

## Best Practices
1. Root account should be used only for account setup
2. One AWS User for each physical user
3. Assign users to groups and assign permissions to groups
4. Strong password policy
5. Use multi-factor authentication
6. Create and use Roles
7. Use Access Keys for CLI or SDK
8. Audit permissions with Credentials report
9. Never share IAM Users and access keys

## Shared Responsibility Model for IAM
AWS is responsible for:
    - infrastructure
    - configuration and vulnerability analysis
    - compliance validation

User is responsible:
    - resoureces management and monitoring
    - MFA activation on accounts
    - Give appropriate permissions
    - Analyze access patterns and permissions