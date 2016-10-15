require 'http'

module Load
	class Google
		def initialize(client_id:)
			googleDetail = HTTP.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise',
			    params: {
			      key: client_id
			 })
  		google_load = JSON.load(googleDetail.to_s)
			@google_data = google_load
			File.write('response.yml', @google_data.to_yaml)

		end

		def write
			File.write('response.yml', @google_data.to_yaml)
		end
	end
end
