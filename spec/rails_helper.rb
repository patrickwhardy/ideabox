ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara::Webkit.configure do |config|
  config.allow_url("fonts.googleapis.com")
  config.allow_url("i.ytimg.com")
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"


  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  
  config.filter_rails_from_backtrace!
  
end
