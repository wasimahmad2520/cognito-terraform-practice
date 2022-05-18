resource "aws_cognito_user_pool" "congito_userpool" {
  name                       = "${var.ENV}-kobo-${var.RESOURCE_PREFIX}-userpool"
  alias_attributes           = ["preferred_username", "phone_number", "email"]
  auto_verified_attributes   = ["phone_number", "email"]
  mfa_configuration          = "OPTIONAL"
  sms_authentication_message = " kobo ${var.RESOURCE_PREFIX} verification code is {####}"

  password_policy {
    minimum_length                   = 8
    temporary_password_validity_days = 1
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    require_lowercase                = true
  }

  user_pool_add_ons {
    advanced_security_mode = "AUDIT"
  }

  verification_message_template {
    default_email_option  = "CONFIRM_WITH_CODE"
    email_message         = "<!DOCTYPE html><html> <head> <meta charset='utf-8'> <meta http-equiv='X-UA-Compatible' content='IE=edge'> <title></title> <meta name='description' content=''> <meta name='viewport' content='width=device-width, initial-scale=1'> <link rel='preconnect' href='https://fonts.googleapis.com'> <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin> <link href='https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap' rel='stylesheet'> <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'> <link href='https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css' rel='stylesheet'/> <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'> <style lang=''> body{font-family: 'Poppins', sans-serif;}.wrapper{/* padding: 0 40rem; */ width: 41%; margin-left: auto; margin-right: auto;}@media screen and (max-width:760px){.wrapper{width:auto}}@media screen and (min-width:768px) and (max-width:900px){.wrapper{width:55%}}.bg-image{/* The image used */ /* Full height */ /* height: 342px; */ background-size: cover; background-repeat: no-repeat; background-attachment: fixed; background: url('https://res.cloudinary.com/dtc1gcm9e/image/upload/v1638806374/newBG_b7lsso.png');}.bg-image2{/* The image used */ /* Full height */ height: auto; background-size: cover; background-repeat: no-repeat; background-attachment: fixed; background: #F8F8F8;}.space{padding: 0 2rem;}.header .text-center{padding: 2rem 0;}@media screen and (min-width:1560px){.header .text-center{padding-top: 1rem;}}.otp-head{font-weight: bolder; font-size: 28px; line-height: 52px; color: #005C37;}@media screen and (max-width:769px){.otp-head{font-size: 18px; line-height: 52px;}}.opt-head-2{font-weight: 500; font-size: 14px; line-height: 45px; /* identical to box height */ color: #6E6E6E;}@media screen and (max-width:1024px){.opt-head-2{font-size: 12px; margin-top: -11px;}}.p-intro{font-weight: normal; font-size: 14px; line-height: 27px; color: #252525; /* identical to box height */}.p-paragraph{font-style: normal; font-weight: 500; font-size: 14px; line-height: 27px; color: #252525; /* identical to box height */}@media screen and (max-width:600px){.p-paragraph{font-size: 14px; line-height: 30px;}}.code span{font-style:bold; font-weight: 600; font-size: 35px; color: #005C37; padding: 20px; letter-spacing: 10px;}@media screen and (max-width:769px){.code span{font-size: 25px;}}.code{margin-left: auto; margin-right: auto; padding:8px; width: fit-content; background: #E9FBF0; margin-left: 0 auto;}@media screen and (max-width:600px){.code{width: fit-content;}}.kindly{font-weight: 500; font-size: 14px; line-height: 27px; color: #252525; padding: 2rem 0;}@media screen and (max-width:600px){.kindly{font-size: 13px; line-height: 30px; padding: 2rem 1rem;}}@media screen and (max-width:600px){.span{font-size: 14px; line-height: 30px;}}.kindly .first-message{margin-bottom: 2rem;}.footer .text-center{font-size: 14px;}@media screen and (max-width:600px){.footer .text-center{font-size: 12px;}}.socials{text-decoration: none;}.socials img{width: 25px;}@media screen and (max-width:600px){.header img, .footer-logo{width: 3rem}}</style> </head> <body> <div class='wrapper'> <header class='bg-image space'> <div class='container header'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844892/logo_tbf9ti.png' width='100' class='mt-5'> <div class='text-center'> <div class='otp-head display-5' style=>VERIFICATION CODE</div><div class='opt-head-2 display-6'>One-Time Password (OTP)</div></div></div></header> <section class='hello mt-5 container space'> <p class='p-intro'>Hello, <span>{username}</span></p><p class='p-paragraph'>To verify your account, please use the following One Time Password (OTP):</p></section> <section class='mt-5 container'> <div class='code'> <span>{{####}}</span> </div></section> <section class='bg-image2 mt-5 container space'> <div class='mt-5 container kindly'> <div class='first-message'> Kindly ignore if your account has already been confirmed. </div><div class='second-message'> Do not share this OTP with anyone. Kobo Accountant takes your account security very seriously. We will never ask you for your OTP, or make any unverified request of your banking details. </div></div></section> <section class='footer' style='margin-top:3rem;'> <div class='text-center'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844892/logo_tbf9ti.png' width='100' class='mx-auto d-block footer-logo'> <div class='mt-3'>Version 1.0</div><div>© 2021. All Right Reserved</div><p class='mt-3'> <a href='https://www.youtube.com/channel/UCHbPNJcoy-i8z1sGUseTQ-g?view_as=subscriber' class='me-3 socials'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1638533153/youtube_wgwd3g.png' > </a> <a href='https://twitter.com/koboaccountant' class='me-3 socials'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1638533153/twitter_tpiy3j.png'> </a> <a href='https://instagram.com/koboaccountant?utm_medium=copy_link' class='me-3 socials'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1638533153/instagram_rt2e9j.png'> </a> <a href='https://www.facebook.com/Koboaccountant/' class='socials'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1638533153/facebook_bnlr3v.png'> </a> </p></div></section> </div></body></html>"
    email_message_by_link = "Hello,<br/><br/>You organisation account owner has created a ${var.RESOURCE_PREFIX} account for you on the <b>OAF</b> platform.<br/><br/>Please click the link below to verify your email address on the platform. {##Verify Email##}<br/><br/> You will receive a separate email address with your login details<br/><br/>Welcome to kobo<br/><br/>Kind regards<br/>kobo accountant Administrator"
    email_subject         = "OTP Verification"
    email_subject_by_link = "Welcome to kobo accountant"
    sms_message           = "Your kobo accountant ${var.RESOURCE_PREFIX} reset password code is {####}"
  }

  username_configuration {
    case_sensitive = false
  }

  admin_create_user_config {
    allow_admin_create_user_only = false

    invite_message_template {
      email_message = "<!DOCTYPE html><html><head> <meta charset='utf-8'> <meta http-equiv='X-UA-Compatible' content='IE=edge'> <title></title> <meta name='description' content=''> <meta name='viewport' content='width=device-width, initial-scale=1'> <link rel='preconnect' href='https://fonts.googleapis.com'> <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin> <link href='https://fonts.googleapis.com/css2?family=Poppins:wght@100;200&display=swap' rel='stylesheet'> <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'> <link href='https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css' rel='stylesheet'/> <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous'> <style lang=''> body{font-family: 'Poppins', sans-serif; /* padding: 0 40rem; */ width: 41%; margin-left: auto; margin-right: auto;}@media screen and (max-width:760px){body{width: auto}}@media screen and (min-width:768px) and (max-width:900px){body{width: 55%}}.bg-image{/* The image used */ /* Full height */ height: 342px; background-size: cover; background-repeat: no-repeat; background-attachment: fixed; background: url('https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637925640/bg1_a5oees.svg');}@media screen and (max-width:1024px){.bg-image{background: url('https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637925640/bg1-mobile_ah2wiz.svg'); height: 233px;}}.bg-image2{/* The image used */ /* Full height */ height: auto; background-size: cover; background-repeat: no-repeat; background-attachment: fixed; background: #F8F8F8;}.space{padding: 0 2rem;}.header .text-center{padding: 2rem 0;}.otp-head{font-weight: 800; font-size: 30px; line-height: 52px; color: #005C37;}@media screen and (max-width:600px){.otp-head{font-size: 25px; line-height: 52px;}}.opt-head-2{font-weight: 500; font-size: 20px; line-height: 45px; /* identical to box height */ color: #6E6E6E; margin-top: 0.5rem;}@media screen and (max-width:1024px){.opt-head-2{font-size: 16px; margin-top: -11px;}}.p-intro{font-weight: normal; font-size: 18px; line-height: 27px; color: #252525; /* identical to box height */}.p-paragraph{font-style: normal; font-weight: 500; font-size: 18px; line-height: 27px; /* identical to box height */ color: #7A7A7A;}@media screen and (max-width:600px){.p-paragraph{font-size: 16px; line-height: 30px;}}span{font-style: bold; font-weight: 600; font-size: 40px; color: green; padding: 10px;}@media screen and (max-width:600px){span{font-size: 30px;}}.code{margin-left: auto; margin-right: auto; padding: 8px; width: fit-content; background: #E9FBF0; margin-left: 0 auto;}@media screen and (max-width:600px){.code{width: fit-content;}}.kindly{font-weight: 500; font-size: 18px; line-height: 27px; color: #252525; padding: 2rem 0;}@media screen and (max-width:600px){.kindly{font-size: 16px; line-height: 30px; padding: 2rem 1rem;}}@media screen and (max-width:600px){.span{font-size: 16px; line-height: 30px;}}.kindly .first-message{margin-bottom: 2rem;}.footer .text-center{font-size: 16px;}</style></head><body> <div> <header class='bg-image space'> <div class='container header'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844892/logo_tbf9ti.png' width='100' class='mt-3'> <div class='text-center'> <div class='otp-head display-5' style=>VERIFICATION CODE</div><div class='opt-head-2 display-6'>One-Time Password (OTP)</div></div></div></header> <section class='hello mt-5 container space'> <p class='p-intro'>Hello {username}</p><p class='p-paragraph'>To verify your account, please use the following One Time Password (OTP) {####}:</p></section> <section class='mt-5 container'> <div class='code'> <span>4</span><span>2</span><span>7</span><span>4</span><span>3</span><span>6</span> </div></section> <section class='bg-image2 mt-5 container space'> <div class='mt-5 container kindly'> <div class='first-message'> Kindly ignore if your account has already been confirmed. </div><div class='second-message'> Do not share this OTP with anyone. Kobo Accountant takes your account security very seriously. We will never ask you for your OTP, or make any unverified request of your banking details. </div></div></section> <section class='footer' style='margin-top:3rem;'> <div class='text-center'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844892/logo_tbf9ti.png' width='100' class='mx-auto d-block'> <div class='mt-3'>Version 1.0</div><div>© 2021. All Right Reserved</div><p class='mt-3'> <a href='https://www.youtube.com/channel/UCHbPNJcoy-i8z1sGUseTQ-g?view_as=subscriber' class='me-3'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844891/youtube_mjllxj.svg' width='30'> </a> <a href='https://twitter.com/koboaccountant' class='me-3'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844891/twitter_abaq55.svg' width='30'> </a> <a href='https://instagram.com/koboaccountant?utm_medium=copy_link' class='me-3'> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844891/instagram_bfvu5f.svg' width='30'> </a> <a href='https://www.facebook.com/Koboaccountant/' class=''> <img src='https://res.cloudinary.com/dtc1gcm9e/image/upload/v1637844891/facebook_ybpvcb.svg' width='30'> </a> </p></div></section> </div></body></html>"
      email_subject = "Your temporary password"
      sms_message   = "Your email is {username} and temporary password is {####}"
    }
  }
  device_configuration {
    device_only_remembered_on_user_prompt = "false"
  }
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  sms_configuration {
    external_id    = var.IAM_COGNITO_ASSUMABLE_ROLE_EXTERNAL_ID
    sns_caller_arn = aws_iam_role.cognito_sms_role.arn
  }

  email_configuration {
    email_sending_account = "DEVELOPER"
    source_arn            = "arn:aws:ses:${var.AWS_REGION}:${var.CURRENT_ACCOUNT_ID}:identity/${var.EMAIL_SENDER}"
  }
  schema {
    name                     = "industry"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "business_type"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }

  }
  schema {
    name                     = "brand_name"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }

  }
  schema {
    name                     = "kind_of_service"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }

  schema {
    name                     = "years_of_experience"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "company_name"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "position_in_company"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "business_type"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "customer_type"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "customer_id"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "user_status"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "identifier"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  schema {
    name                     = "subscription_id"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true  # false for "sub"
    required                 = false # true for "sub"
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }
  tags = var.COMMON_TAGS
}



# resource "aws_cognito_user_pool_domain" "main" {
#   domain          = "${var.ENV}-cognito-${var.RESOURCE_PREFIX}-112233"
#   user_pool_id    = aws_cognito_user_pool.congito_userpool.id
# }

resource "aws_cognito_user_pool_client" "cognito_client" {
  name                                 = "${var.RESOURCE_PREFIX}-app-client"
  user_pool_id                         = aws_cognito_user_pool.congito_userpool.id
  generate_secret                      = true
  allowed_oauth_flows                  = ["implicit"]
  explicit_auth_flows                  = ["ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_CUSTOM_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["phone", "email", "openid", "profile", "aws.cognito.signin.user.admin"]
  callback_urls                        = ["https://${var.WEBAPP_DNS}"]
  supported_identity_providers         = ["COGNITO"]

  depends_on = [
    aws_cognito_user_pool.congito_userpool
  ]
}


resource "aws_iam_policy" "sms_policy" {
  name   = "${var.ENV}-kobo-${var.RESOURCE_PREFIX}-sms_policy-core"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
          "sns:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_iam_role" "cognito_sms_role" {
  name               = "${var.ENV}-${var.RESOURCE_PREFIX}-kobo-sms-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["cognito-idp.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags               = var.COMMON_TAGS
}
resource "aws_iam_role_policy_attachment" "policy_role_attachment" {
  role       = aws_iam_role.cognito_sms_role.id
  policy_arn = aws_iam_policy.sms_policy.arn
}

resource "aws_iam_role" "group_role" {
  name = "${var.ENV}-${var.RESOURCE_PREFIX}-kobo-group-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "cognito-identity.amazonaws.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "cognito-identity.amazonaws.com:aud": "us-east-1:12345678-dead-beef-cafe-123456790ab"
        },
        "ForAnyValue:StringLike": {
          "cognito-identity.amazonaws.com:amr": "authenticated"
        }
      }
    }
  ]
}
EOF
}



resource "aws_cognito_user_group" "cognito-user-groups" {
  description  = "user group managed by cloud.operations@cecureintel.com with terraform"
  for_each     = toset(var.COGNITO_GROUP_LIST)
  name         = each.value
  user_pool_id = aws_cognito_user_pool.congito_userpool.id
}
