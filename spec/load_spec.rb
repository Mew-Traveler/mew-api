require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'

require './lib/airbnb_load.rb'
require './lib/google_load.rb'

CREDENTIALS = YAML.load(File.read('config/credentials.yml'))

describe 'Load specifications' do
  it 'should be able to get the data from Airbnb' do
    airbnb_load = Airbnb::RoomsList.new(
      airbnb_id: CREDENTIALS[:airbnb_id],
      location: "Hsinchu"
    )

    rooms =airbnb_load.rooms
    rooms.length.must_be :>,0
  end

  it 'should be able to get the data from Google' do
    google_load = Google::Mapinfo.new(
      googlemap_id: CREDENTIALS[:googlemap_id],
      origins: "Taipei",
      destinations: "Hsinchu",
      mode: "Train"
    )

    distance =google_load.distanceInfo
    distance.length.must_be :>,0
  end

  # it 'should be able to get the neighborhood information' do
  #   airbnb_load = Load::Airbnb.new(
  #     client_id: CREDENTIALS[:airbnb_id]
  #   )
  #
  #   airbnb_load.getNeighborhood.length.must_be :>, 0
  # end
end
