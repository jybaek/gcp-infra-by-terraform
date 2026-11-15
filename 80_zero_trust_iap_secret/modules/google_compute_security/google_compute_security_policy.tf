resource "google_compute_security_policy" "waf" {
  name        = "${var.service_name}-cloud-armor-waf"
  project     = var.project_id
  description = "Cloud Armor OWASP SQLi/XSS WAF policy"

  rule {
    action   = "deny(403)"
    priority = 1000
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('sqli-v33-stable') || evaluatePreconfiguredWaf('xss-v33-stable')"
      }
    }
    description = "Block OWASP SQL injection and XSS attacks"
  }

  rule {
    action   = "allow"
    priority = 2147483647
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Default allow rule"
  }
}
