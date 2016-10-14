require 'yaml'
require 'http'

# Create a API response dump
credentials = YAML.load(File.read('credentials.yml'))
response = {}
results = {}

# Initialize API connection by getting access_token
#  require client_id and client_secret

feed_response = HTTP.get("https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty")
response[:feed] = feed_response
feed = JSON.load(feed_response.to_s)['data']
results[:feed] = feed

File.write('response.yml', response.to_yaml)
File.write('results.yml', results.to_yaml)
