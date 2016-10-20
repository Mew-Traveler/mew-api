require_relative 'spec_helper.rb'

describe 'Load specifications' do
  it 'should be able to get the data from Airbnb' do
    airbnb_load = Load::Airbnb.new(
      client_id: CREDENTIALS[:airbnb_id]
    )

    airbnb_load.airbnb_data.length.must_be :>, 0
  end

  it 'should be able to get the data from Google' do
    google_load = Load::Google.new(
      key: CREDENTIALS[:googlemap_id]
    )

    google_load.google_data.length.must_be :>, 0
  end

  # it 'should be able to get the neighborhood information' do
  #   airbnb_load = Load::Airbnb.new(
  #     client_id: CREDENTIALS[:airbnb_id]
  #   )

  #   airbnb_load.getNeighborhood.length.must_be :>, 0
  # end
end
