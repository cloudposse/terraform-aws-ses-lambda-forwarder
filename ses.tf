resource "aws_ses_receipt_rule_set" "default" {
  rule_set_name = "${module.label.id}"
}

resource "aws_ses_active_receipt_rule_set" "default" {
  rule_set_name = "${aws_ses_receipt_rule_set.default.rule_set_name}"
}

# Add a header to the email and store it in S3
resource "aws_ses_receipt_rule" "default" {
  name          = "${module.label.id}"
  rule_set_name = "${aws_ses_receipt_rule_set.default.rule_set_name}"
  recipients    = ["${keys(var.forward_emails)}"]
  enabled       = true
  scan_enabled  = true

  s3_action {
    bucket_name = "${aws_s3_bucket.default.bucket}"
    position    = 0
  }

  lambda_action {
    function_arn = "${aws_lambda_function.default.arn}"
    position     = 1
  }

  depends_on = ["aws_ses_receipt_rule_set.default", "aws_s3_bucket_policy.default"]
}
