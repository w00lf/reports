require 'rubygems'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  # Use color in STDOUT
  config.color = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion # now this strategy is faster
    # DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
