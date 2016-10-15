require 'yaml'
require 'http'

# Create a API response dump
credentials = YAML.load(File.read('credentials.yml'))
response = {}
results = {}
# Initialize API connection by getting access_token
# airbnb search list
airbnblist_response = HTTP.get(
  'https://api.airbnb.com/v2/search_results',
  params:
  {
    client_id: credentials[:airbnb_id]
  }
)
response[:airbnblist] = airbnblist_response
airbnblist = JSON.parse(airbnblist_response.to_s)['data']
results[:airbnblist] = airbnblist
# google detail information
googlelist_response = HTTP.get(
  'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise',
  params:
  {
    key: credentials[:googlemap_id]
  }
)
response[:googledetail] = googlelist_response
googledetail = JSON.parse(googlelist_response.to_s)['data']
results[:googledetail] = googledetail

File.write('response.yml', response.to_yaml)
File.write('results.yml', results.to_yaml)
