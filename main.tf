 
 locals {
  
  DOMAIN_NAME = "api.${lower(var.ENV)}.kobooffice.com"
  CONTACT_US_EMAIL_RECEPIENT = "wasim.ahmad@eurustechnologies.com"
  TWITTER_USERNAME = ""
  SOCIAL_SITES_SECRET_ARN = ""
  KOBO_STATIC_FILES_BUCKET = ""
  SERVICE = "cognito-pract"
  UNSUBSCRIBE_URL = "https://cr1c0vans6.execute-api.us-east-1.amazonaws.com/dev/unsubscribe"
#   DB_USERNAME = jsondecode(data.aws_secretsmanager_secret_version.rds_default_secrets_version.secret_string)["username"]
#   DB_PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.rds_default_secrets_version.secret_string)["password"]
#   SMTP_SERVER_SECRETARN = data.aws_secretsmanager_secret_version.smtp_server_credentials_version.secret_id
  RESOURCE_PREFIX = "${lower(var.ENV)}-cognito"
  COGNITO_DOMAIN_NAME = "${lower(var.ENV)}-kobo-domain"
  EMAIL_SENDER = "wasim.ahmad@eurustechnologies.com"
  RDS_AURORA_CLUSTER_NAME = "${local.RESOURCE_PREFIX}-aurora-mysql"
  RDS_VPC_NAME = "${local.RESOURCE_PREFIX}-rds-vpc"
  # real name
  # RDS_DB_NAME = "${lower(var.ENV)}_kobo_office"
  # due to - in dev-was just to config
    RDS_DB_NAME = "dev_was_cognito_office"

  CREATE_TABLES_FILE_NAME = "create_tables.sql"
  USAGE_PLAN_TABLE_INFO_NAME = "${lower(var.ENV)}-cognito-usage-plan-info-table"
}
 
 
 
 module "admin_cognito" {
   source = "./modules/cognito"
   EMAIL_SENDER = local.EMAIL_SENDER
   ENV = var.ENV
   IAM_COGNITO_ASSUMABLE_ROLE_EXTERNAL_ID = var.IAM_COGNITO_ASSUMABLE_ROLE_EXTERNAL_ID
   COGNITO_DOMAIN_NAME = local.COGNITO_DOMAIN_NAME
   AWS_REGION = data.aws_region.current.name
   CURRENT_ACCOUNT_ID = data.aws_caller_identity.current.account_id
   COMMON_TAGS = local.common_tags
   WEBAPP_DNS = var.WEBAPP_DNS
   COGNITO_GROUP_LIST = var.COGNITO_GROUP_LIST
   RESOURCE_PREFIX = var.RESOURCE_PREFIX
 }




