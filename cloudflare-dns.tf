# Add a record to the domain
resource "cloudflare_record" "amazonses_txt_record_techheresy" {
  zone_id = var.cloudflare_zone_id
  name    = "_amazonses"
  value   = aws_ses_domain_identity.techheresy.verification_token
  type    = "TXT"
  ttl     = 600
}

resource "cloudflare_record" "amazonses_dkim_record_techheresy" {
  count   = 3
  zone_id = var.cloudflare_zone_id
  name    = "${aws_ses_domain_dkim.techheresy.dkim_tokens[count.index]}._domainkey"
  type    = "CNAME"
  ttl     = 600
  value   = "${aws_ses_domain_dkim.techheresy.dkim_tokens[count.index]}.dkim.amazonses.com"
}

resource "cloudflare_record" "amazonses_mx_mailfrom_record_techheresy" {
  zone_id = var.cloudflare_zone_id
  name    = aws_ses_domain_mail_from.techheresy.mail_from_domain
  type    = "MX"
  ttl     = "600"
  value   = "10 feedback-smtp.eu-central-1.amazonses.com"
}

resource "cloudflare_record" "amazonses_txt_mailfrom_record_techheresy" {
  zone_id = var.cloudflare_zone_id
  name    = aws_ses_domain_mail_from.techheresy.mail_from_domain
  type    = "TXT"
  ttl     = "600"
  value   = "v=spf1 include:amazonses.com -all"
}
