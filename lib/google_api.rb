require 'http'

module GoogleAPI
  # Service for all Airbnb API calls
  class GoogleApi
    Google_URL = 'https://maps.googleapis.com/'
    Search_Type = 'maps/api/place/nearbysearch/'
    Return_Type = 'jason'
    Parms = '?location=-33.8670,151.1957&radius=500&types=food&name=cruise'
    Google_API_URL = URI.join(Google_URL, "#{Search_Type}", "#{Return_Type}/")
    Search_URL = URI.join(Google_API_URL, "#{Parms}")

    attr_accessor :response

    def initialize()
      credentials = YAML.load(File.read('credentials.yml'))
      @response = 
      HTTP.get( Search_URL, params:{ key: credentials[:googlemap_id] })
    end

    def output()
      File.write('../spec/fixtures/response_google.yml', @response.to_yaml)
      result = JSON.parse(@response.to_s)['data']
      File.write('../spec/fixtures/result_google.yml', result.to_yaml)
    end

  end
end
