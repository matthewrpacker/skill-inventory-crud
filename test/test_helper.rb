require 'sqlite3'

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
    # @database ||= YAML::Store.new('db/skill_inventory_test')

    @database = SQLite3::Database.new('db/skill_inventory_test.db')
    @database.results_as_hash = true

    # SkillInventory.new(database)
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
