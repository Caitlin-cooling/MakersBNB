ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'pg'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'sinatra/base'
require 'pry'
require_relative 'web_helpers'

require(File.join(File.dirname(__FILE__), '../app.rb'))

Capybara.app = MakersBnB

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start
require 'setup_test_database'
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
