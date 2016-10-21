require_relative 'google_api'

module Google
  class TrafficInfo
    attr_reader :infos
    attr_reader :origins, :dest, :mode


    def initialize(google_api:nil,origins:nil,destinations:nil,mode:nil)
      @origins = origins
      @dest = destinations
      @mode = mode
      @googleapi = google_api
    end

    def trafficAnaly
      return @infos if @infos

      distance_data = @googleapi.distanceInfo(@origins, @dest, @mode)
      @infos = distance_data.map { |item|
        infos = info(item)
      }
    end

    private

    def info(item)
      info = item[0]
      # info = {
      #   distance: item['distance'][0],
      #   duration: item['duration'][0],
      # }
    end

  end
end
