require 'http'

module Load
	class Airbnb
		
		def initialize(client_id:)
			airbnbList_response = HTTP.get('https://api.airbnb.com/v2/search_results',
			   	params: {
			    	client_id: client_id
			})
			response[:airbnblist] = airbnbList_response
			airbnblist = JSON.load(airbnbList_response.to_s)['data']
			results[:airbnblist] = airbnblist
		end

		def write
			File.write('results.yml', results.to_yaml)
		end
	end
end