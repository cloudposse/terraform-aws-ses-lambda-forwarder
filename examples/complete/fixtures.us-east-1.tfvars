# https://docs.aws.amazon.com/general/latest/gr/ses.html
region = "us-east-1"

namespace = "eg"

stage = "test"

name = "ses-lambda-forwarder"

relay_email = "example@example.com"

forward_emails = {
  "some_email@example.com"  = ["my_email@example.com"]
  "other_email@example.com" = ["my_email@example.com"]
}

domain = "testing.cloudposse.co"

spf = "v=spf1 include:amazonses.com -all"

lambda_runtime = "nodejs8.10"

artifact_url = "https://artifacts.cloudposse.com/terraform-external-module-artifact/example/test.zip"

artifact_filename = "lambda.zip"
