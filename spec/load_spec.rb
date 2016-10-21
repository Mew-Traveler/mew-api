require_relative 'spec_helper.rb'

describe 'Load specifications' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock

    c.filter_sensitive_data('<CLIENT_ID>') {CREDENTIALS[:airbnb_id]}
    c.filter_sensitive_data('<CLIENT_ID>') {CREDENTIALS[:googlemap_id]}
  end

  before do
    VCR.insert_cassette CASSETTE_FILE, record: :new_episodes

  #it 'should be able to get the data from Airbnb' do
    airbnb_load = Load::Airbnb.new(
      client_id: CREDENTIALS[:airbnb_id]
    )
    airbnb_load.write
   # airbnb_load.airbnb_data.length.must_be :>, 0
  end

  after do
    VCR.eject_cassette
  end

  # it 'should be able to get the data from Google' do
  #   google_load = Load::Google.new(
  #     key: CREDENTIALS[:googlemap_id]
  #   )

  #   google_load.google_data.length.must_be :>, 0
  # end

  # it 'should be able to get the neighborhood information' do
  #   airbnb_load = Load::Airbnb.new(
  #     client_id: CREDENTIALS[:airbnb_id]
  #   )

  #   airbnb_load.getNeighborhood.length.must_be :>, 0
  # end
end
