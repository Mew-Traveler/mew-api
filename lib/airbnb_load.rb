require 'http'

module Load
  class Airbnb
    attr_reader :airbnb_data

    def initialize(client_id:)
      airbnbList_response = HTTP.get('https://api.airbnb.com/v2/search_results',
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
