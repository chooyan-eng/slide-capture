import sys
import requests
import json

import configparser

config = configparser.ConfigParser()
config.read('config.ini')

headers = {
    'Prediction-Key': '',
    'Prediction-key': config['CustomVision']['Prediction-Key'],
    'Content-Type': 'application/octet-stream',
}

iteration_id = config['CustomVision']['iteration_id']
project = config['CustomVision']['project']

url = "https://southcentralus.api.cognitive.microsoft.com/customvision/v2.0/Prediction/%s/image?iterationId=%s" % (project, iteration_id)
data = open(sys.argv[1], 'rb')

response = requests.post(url, data=data, headers=headers)
result = json.loads(response.text)

result_dict = {}
for prediction in result['predictions']:
  result_dict[prediction['tagName']] = prediction['probability']

print(result_dict)

if result_dict["different"] > result_dict["same"]:
  return_code = 1
else:
  return_code = 0
  
sys.exit(return_code)
