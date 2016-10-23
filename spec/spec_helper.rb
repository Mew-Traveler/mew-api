# frozen_string_literal: true
require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'vcr'
require 'webmock'

require './lib/airbnb_api.rb'
require './lib/google_api.rb'
require 'simplecov'
SimpleCov.start

FIXTURES_FOLDER = 'spec/fixtures'
CASSETTES_FOLDER = "#{FIXTURES_FOLDER}/cassettes"

CREDENTIALS = YAML.load(File.read('config/credentials.yml'))
