output "COGNITO_USER_POOL_ARN"{
  value = aws_cognito_user_pool.congito_userpool.arn
}


output "COGNITO_USER_POOL_ID"{
  value = aws_cognito_user_pool.congito_userpool.id
}
output "COGNITO_USER_CLIENT_SECRET"{
  value = aws_cognito_user_pool_client.cognito_client.client_secret
}

output "COGNITO_USER_CLIENT_ID"{
  value = aws_cognito_user_pool_client.cognito_client.id
}