require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/channels'
  # Temporary, there's no aesthetic way
  # of testing GraphQL Controller
  add_filter 'app/controllers'
  add_filter 'app/mailers'
  add_filter 'app/jobs'
  add_filter 'app/graphql/types'
  add_filter 'app/graphql/backend_schema'
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# require shared_examples
Dir["#{Rails.root}/test/shared_examples/*.rb"].each {|file| require file } 

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include ActionDispatch::TestProcess

  CarrierWave.root = Rails.root.join('test/fixtures')

  def before_setup
    super
    DatabaseCleaner.start
  end

  def after_teardown
    super
    DatabaseCleaner.clean
    CarrierWave.clean_cached_files!(0)
  end
end
