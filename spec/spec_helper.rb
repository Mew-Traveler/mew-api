require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'vcr'
require 'webmock'

require './lib/airbnb_load.rb'
require './lib/google_load.rb'

FIXTURES_FOLDER = 'spec/fixtures'
CASSETTES_FOLDER = "#{FIXTURES_FOLDER}/cassettes"

CREDENTIALS = YAML.load(File.read('config/credentials.yml'))