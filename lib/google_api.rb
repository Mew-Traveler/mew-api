# frozen_string_literal: true
require_relative 'sim_api.rb'

module Load
  # Service for all Google API calls
  class Google
    # Setting the URL and parameters
    GOOGLE_URL = 'https://maps.googleapis.com/'
    SEARCH_TYPE = 'maps/api/place/nearbysearch/'
    RETURN_TYPE = 'json'
    PARMS = '?location=-33.8670,151.1957&radius=500&types=food&name=cruise'
    GOOGLE_API_URL = URI.join(GOOGLE_URL, "#{SEARCH_TYPE}.to_s",
                              "#{RETURN_TYPE}/")
    SEARCH_URL = URI.join(GOOGLE_API_URL, "#{PARMS}.to_s")

    attr_reader :google_data

    def initialize(key:)
      http = HTTPGET.new
      google_detail = http.http_get(SEARCH_URL, 'key', key)
      google_load = JSON.parse(google_detail.to_s)
      @google_data = google_load
    end

    def write
      File.write('./spec/fixtures/google_data.yml', @google_data.to_yaml)
    end
  end
end
