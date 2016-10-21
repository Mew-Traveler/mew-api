require 'http'

module Load
  # Service for all Airbnb API calls
  class Airbnb
    #Setting the URL and parameters
    Airbnb_URL = 'https://api.airbnb.com/'
    API_VER = 'v2'
    Airbnb_API_URL = URI.join(Airbnb_URL, "#{API_VER}/")
    Search_URL = URI.join(Airbnb_API_URL, "search_results")

    attr_reader :airbnb_data

    def initialize(client_id:)
      airbnbList_response = HTTP.get(
        Search_URL,
        params:
        {
          client_id: client_id
        }
      )

      airbnb_load = JSON.load(airbnbList_response.to_s)
      @airbnb_data = airbnb_load
    end

    def write
      File.write('./spec/fixtures/airbnb_data.yml', @airbnb_data.to_yaml)
    end

    def getNeighborhood
      neighborhood = @airbnb_data['metadata']['facets']['neighborhood_facet']
      neighborhood
    end
  end
end
