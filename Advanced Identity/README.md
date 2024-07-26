## Security Token Service
Enables to create limited-provileges credentials to access resources. The use cases are:
- Identity federation, to manage user identity with external systems.
- IAM Roles for cross/same account access
- IAM Roles for EC2: to provide instances temporary credentials

## Cognito
Is a way to provide identity to application users (potentially millions) instead of creating IAM Users for them.

## Directory Services
It's the equivalent of Microsoft Active Directory. It has a managed Microsoft AD where you can create your own AD and support MFA. You can also trust connections with on-premise AD. You also have the AD connector, a proxy that redirects requests to an on-premise AD but supporting MFA. Then there is Simple AD, an AD-compatible managed directory on AWS that cannot be joined with on-premise AD.

## IAM Identity Center
Is the successor of AWS Single Sign-On, one login for all AWS accounts on all organizations, business cloud applciations, SAML-compatible applications and EC2 Windows instances. It has many identity providers, such a built-in one or external (Okta, AD, etc...)
