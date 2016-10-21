require 'http'

module Airbnb
  class RoomsList
    require 'http'

    attr_reader :airbnb_id, :location

    def initialize(airbnb_id:, location:)
      @airbnb_id = airbnb_id
      @location = location
    end

    def rooms
      return @rooms if @rooms

      rooms_response =
        HTTP.get("https://api.airbnb.com/v2/search_results",
                 params: { client_id: @airbnb_id,
                           location: @location
                         })
      rooms = JSON.load(rooms_response.to_s)['search_results']

      rooms_data = rooms.first['listing']
      @rooms = {city: rooms_data['city'],
                id: rooms_data['id']
               }
    end

  end
end
