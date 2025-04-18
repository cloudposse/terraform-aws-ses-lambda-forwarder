# https://docs.aws.amazon.com/general/latest/gr/ses.html
region = "us-east-2"

namespace = "eg"

stage = "test"

name = "lambda-forwarder-test"

relay_email = "example@example.com"

forward_emails = {
  "some_email@example.com"  = ["my_email@example.com"]
  "other_email@example.com" = ["my_email@example.com"]
}

domain = "modules.cptest.test-automation.app"

spf = "v=spf1 include:amazonses.com -all"

lambda_runtime = "nodejs22.x"

artifact_url = "https://cplive-core-ue2-public-lambda-artifacts.s3.us-east-2.amazonaws.com/terraform-aws-ses-lambda-forwarder/terraform-aws-ses-lambda-forwarder-pr-64.zip"

artifact_filename = "lambda.zip"
