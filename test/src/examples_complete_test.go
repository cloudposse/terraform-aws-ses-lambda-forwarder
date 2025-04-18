package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	artifactFile := terraform.Output(t, terraformOptions, "artifact_file")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "../../lambda.zip", artifactFile)

	// Run `terraform output` to get the value of an output variable
	artifactUrl := terraform.Output(t, terraformOptions, "artifact_url")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "https://artifacts.cloudposse.com/terraform-external-module-artifact/example/test.zip", artifactUrl)

	// Run `terraform output` to get the value of an output variable
	lambdaFunctionArn := terraform.Output(t, terraformOptions, "lambda_function_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, lambdaFunctionArn, "function:eg-test-lambda-forwarder-test")

	// Run `terraform output` to get the value of an output variable
	lambdaIamPolicyArn := terraform.Output(t, terraformOptions, "lambda_iam_policy_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, lambdaIamPolicyArn, "policy/eg-test-lambda-forwarder-test")

	// Run `terraform output` to get the value of an output variable
	lambdaIamPolicyName := terraform.Output(t, terraformOptions, "lambda_iam_policy_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-lambda-forwarder-test", lambdaIamPolicyName)

	// Run `terraform output` to get the value of an output variable
	s3BucketArn := terraform.Output(t, terraformOptions, "s3_bucket_arn")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "arn:aws:s3:::eg-test-lambda-forwarder-test", s3BucketArn)

	// Run `terraform output` to get the value of an output variable
	sesDomainIdentityArn := terraform.Output(t, terraformOptions, "ses_domain_identity_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, sesDomainIdentityArn, "identity/testing.cloudposse.co")

	// Run `terraform output` to get the value of an output variable
	sesReceiptRuleName := terraform.Output(t, terraformOptions, "ses_receipt_rule_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-lambda-forwarder-test", sesReceiptRuleName)

	// Run `terraform output` to get the value of an output variable
	sesReceiptRuleSetName := terraform.Output(t, terraformOptions, "ses_receipt_rule_set_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "eg-test-lambda-forwarder-test", sesReceiptRuleSetName)
}
