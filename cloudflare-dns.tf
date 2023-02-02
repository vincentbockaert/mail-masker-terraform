# Add a record to the domain
resource "cloudflare_record" "techheresy_com" {
  zone_id = var.cloudflare_zone_id
  name    = "_amazonses"
  value   = aws_ses_domain_identity.main_domain_identity.verification_token
  type    = "TXT"
  ttl     = 3600
}



