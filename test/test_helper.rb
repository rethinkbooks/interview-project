require 'simplecov'

SimpleCov.start 'rails' do
  add_group 'Services', 'app/services'
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'

Minitest::Reporters.use!

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'

  config.hook_into :webmock
end

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module ActionController
  class TestCase
    include Devise::TestHelpers
  end
end
