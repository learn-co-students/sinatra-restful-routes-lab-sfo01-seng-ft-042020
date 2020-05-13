class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id].to_i)
    erb :edit
  end

  patch '/recipes/:id' do
    Recipe.find(params[:id].to_i).update(params[:recipe])
    redirect :"/recipes/#{params[:id]}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id].to_i)
    erb :show
  end

  post '/recipes/new' do
    @recipe = Recipe.create(params[:recipe])
    redirect :"/recipes"
  end

  delete '/recipes/:id' do
    Recipe.find(params[:id].to_i).destroy
    redirect :"/recipes"
  end

end
