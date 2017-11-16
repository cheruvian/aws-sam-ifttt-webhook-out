# aws-sam-ifttt-webhook-out
Amazon Lambda trigger that calls out of your AWS account and into IFTTT.

The IFTTT Webhook will be called whenever something is uploaded into the created S3 bucket, but any valid Event Source could trigger your webhook.

## AWS Deployment
1. Configure your AWS credentials and region.
1. Set an environment variable named `S3_BUCKET`.  This will be used for uploading your lambda function artifacts.
1. Set an environment variable named `WEBHOOK_EVENT_NAME`. This should map to the Event name you chose in your IFTTT Applet. See below.
1. Set an environment variable named `WEBHOOK_KEY`. This should map to the IFTTTT Webhook Service Key for your IFTTT user account. See below.
1. Run `./pd.sh` to `p`ackage & `d`eploy


## IFTTT Webhook Applet Event Name
To configure your Webhook Applet simply choose the Webhooks trigger and provide an Event Name.
![IFTTT Applet Configuration Screenshot](/img/ifttt-applet.jpg)

## IFTTT Webhook Service Key
1. Navigate to https://ifttt.com/services/maker_webhooks/settings
1. Under "Account Info" locate the "URL".  It will look like: https://maker.ifttt.com/use/SOMESTRINGOFCHARACTERS
1. Open that URL and copy your key. It should say "Your key is: SOMESTRINGOFCHARACTERS".