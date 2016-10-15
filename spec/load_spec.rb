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
	end

	it 'should be able to get the data from Google' do
		google_load = Load::Google.new(
			client_id: CREDENTIALS[:googlemap_id]
		)
	end
end