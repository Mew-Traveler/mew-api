# frozen_string_literal: true
require_relative 'sim_api.rb'

module Load
  # Service for all Airbnb API calls
  class Airbnb
    # Setting the URL and parameters
    AIRBNB_URL = 'https://api.airbnb.com/'
    API_VER = 'v2'
    AIRBNB_API_URL = URI.join(AIRBNB_URL, "#{API_VER}/")
    SEARCH_URL = URI.join(AIRBNB_API_URL, 'search_results')

    attr_reader :airbnb_data

    def initialize(client_id:)
      airbnb_response = http_get(SEARCH_URL, 'client_id', client_id)
      airbnb_load = JSON.parse(airbnb_response.to_s)
      @airbnb_data = airbnb_load
    end

    def write
      File.write('./spec/fixtures/airbnb_data.yml', @airbnb_data.to_yaml)
    end

    def neighborhood
      neighborhood = @airbnb_data['metadata']['facets']['neighborhood_facet']
      neighborhood
    end
  end
end
