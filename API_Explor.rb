require 'yaml'
require 'http'

# Create a API response dump
credentials = YAML.load(File.read('credentials.yml'))
response = {}
results = {}
# Initialize API connection by getting access_token
# airbnb search list
airbnbList_response = HTTP.get(
  'https://api.airbnb.com/v2/search_results',
    params: {
      client_id: credentials[:airbnb_id]
    })
response[:airbnblist] = airbnbList_response
airbnblist = JSON.load(airbnbList_response.to_s)['data']
results[:airbnblist] = airbnblist
# google detail information
googleDetail = HTTP.get(
  'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise',
    params: {
      key: credentials[:googlemap_id]
    })
  response[:googledetail] = googleDetail
  googledetail = JSON.load(googleDetail.to_s)['data']
  results[:googledetail] = googledetail

File.write('response.yml', response.to_yaml)
File.write('results.yml', results.to_yaml)
