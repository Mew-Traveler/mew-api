require 'http'

module Load
	class Google
		attr_reader :google_data

		def initialize(key:)
			googleDetail = HTTP.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise',
			    params: {
			      key: key
			 })

  			google_load = JSON.load(googleDetail.to_s)
			@google_data = google_load['data']
		end

		def write
			File.write('./spec/fixtures/response.yml', @google_data.to_yaml)
		end
	end
end
