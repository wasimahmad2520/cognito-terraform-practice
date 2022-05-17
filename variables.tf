
variable "ENV" {
  type = string
  default = "dev-practice"
}

variable "IAM_COGNITO_ASSUMABLE_ROLE_EXTERNAL_ID" {
default = "ghU968996890"
}

variable "COGNITO_GROUP_LIST" {
  type = list(string)
  default = ["super_admim", "admin", "merchant", "client"]
}

variable "RESOURCE_PREFIX" {
    type = string
    default = "cognito"
}
variable "WEBAPP_DNS" {
  default = "kobooffice.com"
} 





