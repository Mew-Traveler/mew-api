require 'http'

module Google
  class Mapinfo
    attr_reader :google_data, :origins, :destinations, :mode

    def initialize(googlemap_id:, origins:, destinations:, mode:)
      @googlemap_id = googlemap_id
      @origins = origins
      @dest = destinations
      @mode = mode
    end

    def distanceInfo
      return @distance if @distance
      distanceDetail = HTTP.get('https://maps.googleapis.com/maps/api/distancematrix/json',
        params:
        {
          key: @googlemap_id,
          origins: @origins,
          destinations: @dest,
          mode: @mode
        })
      distance_data = JSON.load(distanceDetail.to_s)['rows'][0]['elements']
      @distance = {
        distance:distance_data[0]['distance'],
        duration:distance_data[0]['duration']
      }
    end
    #      distanceDetail = HTTP.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise',
  end
end
