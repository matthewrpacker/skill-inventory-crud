ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'launchy'

module TestHelpers

  def teardown
    SkillInventory.delete_all
    super
  end

  def self.database
    @database ||= YAML::Store.new('db/skill_inventory_test')
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
