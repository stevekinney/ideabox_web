require_relative './idea_box'

class IdeaBoxApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'
  set :public_folder, 'public/assets'
  
  IdeaBox = IdeaStore.new('db/ideabox')

  get '/' do
    erb :index, locals: {ideas: IdeaBox.all.sort, idea: Idea.new(params)}
  end

  not_found do
    erb :error
  end

  post '/' do
    IdeaBox.create(params[:idea])
    redirect '/'
  end

  delete '/:id' do |id|
    IdeaBox.delete(id.to_i)
    redirect '/'
  end

  get '/:id/edit' do |id|
    idea = IdeaBox.find(id.to_i)
    erb :edit, locals: {idea: idea}
  end

  put '/:id' do |id|
    IdeaBox.update(id.to_i, params[:idea])
    redirect '/'
  end

  post '/:id/like' do |id|
    idea = IdeaBox.find(id.to_i)
    idea.like!
    IdeaBox.update(id.to_i, idea.to_h)
    redirect '/'
  end

  get '/:tag' do |tag|
    ideas = IdeaBox.find_by_tag(tag)
    idea.tag
    IdeaBox.update(id.to_i, idea.to_h)
    redirect '/'
  end

end
