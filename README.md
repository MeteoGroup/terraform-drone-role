# MeteoGroup Drone role Terraform module

Creates an [IAM role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
to be assumed by [Drone CI pipeline steps](https://docs.drone.io/user-guide/pipeline/steps/)
for managing AWS resources


## Inputs

`account_id`\
ID of the AWS account in which the role will be created

`name`\
The created role will be named `drone-<name>`. Usually corresponds to the name of the 'droned' Git repository

`policy_document`\
JSON policy document with the permissions of the created role
