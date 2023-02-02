resource "aws_ses_domain_identity" "techheresy" {
  domain = "techheresy.com"
}

resource "aws_ses_domain_dkim" "techheresy" {
  domain = aws_ses_domain_identity.techheresy.domain
  depends_on = [
    cloudflare_record.amazonses_txt_record_techheresy
  ]
}

