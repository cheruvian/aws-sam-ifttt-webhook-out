package main

import (
	"context"
	"fmt"
	"net/http"
	"net/url"
	"os"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

var (
	webHookEventName string = os.Getenv("WEBHOOK_EVENT_NAME")
	webHookKey string = os.Getenv("WEBHOOK_KEY")
)

func Handler(_ context.Context, s3Event events.S3Event) {
	iftttUrl := fmt.Sprintf("https://maker.ifttt.com/trigger/%s/with/key/%s", webHookEventName, webHookKey)

	resp, err := http.PostForm(iftttUrl, url.Values{"key": {"Value"}, "id": {"123"}})

	if err != nil {
		fmt.Println(err)
	}

	fmt.Printf("Response: %+v", resp)
}

func main() {
	lambda.Start(Handler)
}
