#!/usr/bin/env bash


if [ -z "$WEBHOOK_EVENT_NAME" ]; then
    echo "\$WEBHOOK_EVENT_NAME was not set. Set your webhook event name, refer to the readme for details.";
    exit 1;
fi

if [ -z "$WEBHOOK_KEY" ]; then
    echo "\$WEBHOOK_KEY was not set. Set your webhook key, refer to the readme for details.";
    exit 1;
fi

set -x
aws cloudformation deploy \
    --stack-name aws-sam-ifttt-webhook-out \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-file build/packaged-template.yaml \
    --parameter-overrides "WebhooksEventName=$WEBHOOK_EVENT_NAME" "WebhooksKey=$WEBHOOK_KEY"
