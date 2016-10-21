require_relative 'airbnb_api'

module Airbnb
  class RentInfo
    attr_reader :location
    attr_reader :infos

    def initialize(airbnb_api:nil,location:nil)
      @location = location
      @airbnbapi = airbnb_api

    end

    def infos
      return @infos if @infos

      rooms_data = @airbnbapi.rooms_info(@location)
      @infos = rooms_data.map { |item|
        room = room(item)
      }
    end

    private
    
    def room(item)
      item = item['listing']
      room = {
        city: item['city'],
        name: item['name'],
        pic_url: item['picture_url'],
        id: item['id']
      }
    end

  end
end
