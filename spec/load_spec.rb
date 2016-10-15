require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'

require './lib/airbnb_load.rb'
require './lib/google_load.rb'

CREDENTIALS = YAML.load(File.read('config/credentials.yml'))

describe 'Load specifications' do
	it 'should be able to get the data from Airbnb' do
		airbnb_load = Load::Airbnb.new(
			client_id: CREDENTIALS[:airbnb_id]
		)

		#airbnb_load.airbnb_data.length.must_be :>, 0
	end

	it 'should be able to get the data from Google' do
		google_load = Load::Google.new(
			key: CREDENTIALS[:googlemap_id]
		)

		#google_load.google_data.length.must_be :>, 0
	end
end