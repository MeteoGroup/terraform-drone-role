variable "account_id" {
  description = "ID of the AWS account in which the role will be created"
}

variable "name" {
  description = "The created role will be named `drone-<name>`. Usually corresponds to the name of the 'droned' Git repository"
}

variable "policy_document" {
  description = "JSON policy document with the permissions of the created role"
}

variable "external_id" {
  description = "The ExternalID of the created role - used to secure assuming the role"
}
