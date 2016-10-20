require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'

require './lib/airbnb_load.rb'
require './lib/google_load.rb'

CREDENTIALS = YAML.load(File.read('config/credentials.yml'))