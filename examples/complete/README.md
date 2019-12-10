# Example

## Upload Artifact

Ensure artifacts are uploaded to the public with an ACL of `public-read`

```
aws s3 cp --acl public-read test.zip s3://artifacts.prod.cloudposse.org/terraform-external-module-artifact/example/test.zip
```

__NOTE__: this is the *public* artifact storage for [Cloud Posse](https://cloudposse.com)

