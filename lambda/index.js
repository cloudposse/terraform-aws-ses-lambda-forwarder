var LambdaForwarder = require("aws-lambda-ses-forwarder");

exports.handler = function(event, context, callback) {
    var overrides = {
        config: {
            fromEmail: process.env.EMAIL_FROM,
            emailBucket: process.env.EMAIL_BUCKET_NAME,
            emailKeyPrefix: process.env.EMAIL_BUCKET_PATH,
            forwardMapping: JSON.parse(process.env.EMAIL_MAPPING)
        }
    };
    LambdaForwarder.handler(event, context, callback, overrides);
};
