resource "aws_ses_domain_identity" "main_domain_identity" {
  domain = "techheresy.com"
}

resource "aws_ses_domain_mail_from" "main_domain_mail_from" {
  domain                 = aws_ses_domain_identity.main_domain_identity.domain
  mail_from_domain       = "from_ses.${aws_ses_domain_identity.main_domain_identity.domain}"
  behavior_on_mx_failure = "RejectMessage" // https://docs.aws.amazon.com/ses/latest/APIReference/API_SetIdentityMailFromDomain.html
}

