require 'http'

module Load
	class Airbnb
		attr_reader :airbnb_data

		def initialize(client_id:)
			airbnbList_response = HTTP.get('https://api.airbnb.com/v2/search_results',
			   	params: {
			    	client_id: client_id
			})

			airbnb_load = JSON.load(airbnbList_response.to_s)
			@airbnb_data = airbnb_load['data']
		end

		def write
			File.write('./spec/fixtures/results.yml', @airbnb_data.to_yaml)
		end
	end
end
