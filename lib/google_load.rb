require 'http'

module Load
	class Google

		def initialize(key:)
			googleDetail = HTTP.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise',
			    params: {
			      key: key
			 })
			response[:googledetail] = googleDetail
  			googledetail = JSON.load(googleDetail.to_s)['data']
  			results[:googledetail] = googledetail
		end

		def write
			File.write('response.yml', response.to_yaml)
		end
	end
end