require 'http'

module AirbnbAPI
  # Service for all Airbnb API calls
  class AirbnbApi
    Airbnb_URL = 'https://api.airbnb.com/'
    API_VER = 'v2'
    Airbnb_API_URL = URI.join(Airbnb_URL, "#{API_VER}/")
    Search_URL = URI.join(Airbnb_API_URL, "search_results")

    attr_accessor :response

    def initialize()
      credentials = YAML.load(File.read('credentials.yml'))
      @response = 
      HTTP.get( Search_URL, params:{ client_id: credentials[:airbnb_id] })
    end

    def output()
      File.write('../spec/fixtures/response_airbnb.yml', response.to_yaml)
      result = JSON.parse(@response.to_s)['data']
      File.write('../spec/fixtures/result_airbnb.yml', result.to_yaml)
    end

  end
end
