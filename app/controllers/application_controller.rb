class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do 
    @recipes = Recipe.all
    #binding.pry
    erb :index
  end 

  get '/recipes/new' do 
    erb :new
  end 

  post '/recipes' do 
    Recipe.create(params)
    #binding.pry
    redirect "/recipes/#{Recipe.last.id}"
  end 

  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end 

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end 

  patch '/recipes/:id' do 
    Recipe.update(params[:id],params[:recipe])
    redirect "/recipes/#{params[id]}"
  end 

  delete '/recipes/:id/delete' do 
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end 
end