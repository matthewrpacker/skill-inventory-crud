require_relative '../models/skill_inventory'

class SkillInventoryApp
  # set :root, File.join(File.dirname(__FILE__), '..')
  # set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  delete '/skills/:id' do |id|
    SkillInventory.destroy(id.to_i)
    redirect '/skills'
  end
end
