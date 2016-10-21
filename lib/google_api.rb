require 'http'

module Load
  # Service for all Google API calls
  class Google
    #Setting the URL and parameters
    Google_URL = 'https://maps.googleapis.com/'
    Search_Type = 'maps/api/place/nearbysearch/'
    Return_Type = 'json'
    Parms = '?location=-33.8670,151.1957&radius=500&types=food&name=cruise'
    Google_API_URL = URI.join(Google_URL, "#{Search_Type}", "#{Return_Type}/")
    Search_URL = URI.join(Google_API_URL, "#{Parms}")

    attr_reader :google_data

    def initialize(key:)
      googleDetail = HTTP.get(
        Search_URL,
        params:
        {
          key: key
        }
      )
      google_load = JSON.load(googleDetail.to_s)
      @google_data = google_load
      #write
    end

    def write
      File.write('./spec/fixtures/google_data.yml', @google_data.to_yaml)
    end
  end
end
