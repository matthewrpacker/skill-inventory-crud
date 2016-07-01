require 'bundler'
Bundler.require

# Initialize the database
$db = SQLite3::Database.new("db/skill_inventory_#{ENV['RACK_ENV']}.db")
$db.results_as_hash = true

# Get the path of the root of the app
APP_ROOT = File.expand_path('..', __dir__)

# Configure SkillInventoryApp settings
class SkillInventoryApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end

# Require the controller(s)
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }

# Require the model(s)
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }
