require 'sir_trevor_rails'
require 'combustion'

Combustion.initialize! :active_record, :action_view do
  config.active_support.test_order = :random
end


require 'capybara/rails'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'
require 'wrong/adapters/minitest'
require 'pry'


Wrong.config.alias_assert :expect, override: true

MiniTest::Spec.class_eval do
  include Wrong::Assert
  include Wrong::Helpers
end


class ActiveSupport::TestCase
  extend MiniTest::Spec::DSL
  include Wrong::Assert
  include Wrong::Helpers
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end
