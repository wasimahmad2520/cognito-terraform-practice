locals { 
  common_tags = { 
    environment     = lower(var.ENV)
    project         = "cognito practice" 
    managedby       = "wasim.ahmad@eurustechnologies.com"
  } 
}