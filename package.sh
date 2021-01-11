#!/usr/bin/env bash -e

if [ -z "$S3_BUCKET" ]; then
    echo "\$S3_BUCKET was not set. Set an S3 Bucket for uploading the SAM artifacts";
    exit 1;
fi

mkdir -p build

pushd webhook
GOOS=linux GOARCH=amd64 go build -o bin/webhook main.go
pushd bin
zip -r - * > ../../build/aws-sam-ifttt-webhook-out.zip
popd && popd

set -x

aws cloudformation package \
    --template-file sam/template.yaml \
    --s3-bucket $S3_BUCKET \
    --output-template-file build/packaged-template.yaml
