import sys
sys.path.append('./lib')
import requests
import json
import os

# defining the api-endpoint 
WEBHOOK_URL = "https://maker.ifttt.com/trigger/" + os.environ['WEBHOOK_EVENT_NAME'] + "/with/key/" + os.environ['WEBHOOK_KEY']
print("Using URL:%s"%WEBHOOK_URL)
def lambda_handler(event, context):
    
    data = {
        'value1': 'val1',
        'value2': 'val2',
        'value3': json.dumps(event)
    }
     
    # sending post request and saving response as response object
    response = requests.post(url = WEBHOOK_URL, data = data)
     
    # extracting response text 
    print("The Response is:%s"%response)