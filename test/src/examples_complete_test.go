package test

import (
	"fmt"
	"math/rand"
	"strconv"
	"testing"
	"time"	

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	randId := strconv.Itoa(rand.Intn(100000))
	attributes := []string{randId}
	
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
		Vars: map[string]interface{}{
			"attributes": attributes,
		},		
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
	assert.Equal(t, "https://cplive-core-ue2-public-lambda-artifacts.s3.us-east-2.amazonaws.com/terraform-aws-ses-lambda-forwarder/terraform-aws-ses-lambda-forwarder-pr-64.zip", artifactUrl)

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
	assert.Equal(t, fmt.Sprintf("eg-test-lambda-forwarder-test-%s", randId), lambdaIamPolicyName)

	// Run `terraform output` to get the value of an output variable
	s3BucketArn := terraform.Output(t, terraformOptions, "s3_bucket_arn")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, fmt.Sprintf("arn:aws:s3:::eg-test-lambda-forwarder-test-%s", randId), s3BucketArn)

	// Run `terraform output` to get the value of an output variable
	sesDomainIdentityArn := terraform.Output(t, terraformOptions, "ses_domain_identity_arn")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, sesDomainIdentityArn, "identity/modules.cptest.test-automation.app")

	// Run `terraform output` to get the value of an output variable
	sesReceiptRuleName := terraform.Output(t, terraformOptions, "ses_receipt_rule_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, fmt.Sprintf("eg-test-lambda-forwarder-test-%s", randId), sesReceiptRuleName)

	// Run `terraform output` to get the value of an output variable
	sesReceiptRuleSetName := terraform.Output(t, terraformOptions, "ses_receipt_rule_set_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, fmt.Sprintf("eg-test-lambda-forwarder-test-%s", randId), sesReceiptRuleSetName)
}
