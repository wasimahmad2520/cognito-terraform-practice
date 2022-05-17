



data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

################################################################################
# NOTE:

# 1. create a mannual secret in "Secret Manager" service
# 2. Secret Type    : OTHER
# 3. Keys Name      : "username" & "password"
# 4. Encryption Key : DefaultEncryptionKey
# 5. Secret Name    : "${var.RESOURCE_PREFIX}-app-database-secrets"
################################################################################
# data "aws_secretsmanager_secret" "rds_default_secrets" {
#   name = "${local.RESOURCE_PREFIX}-app-database-secrets"
# }
# data "aws_secretsmanager_secret_version" "rds_default_secrets_version" {
#   secret_id = data.aws_secretsmanager_secret.rds_default_secrets.id
# }


