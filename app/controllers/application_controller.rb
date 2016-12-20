require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index
  end

  get '/posts' do 
  	@posts = Post.all
  	erb :posts
  end

  get '/posts/new' do 
  	erb :new_post
  end  

  get '/posts/:id' do 
  	@post = Post.find(params[:id])
  	erb :show
  end

  post '/posts/new' do
  	@post = Post.create(params[:post]) 
  	redirect "/posts"
  end

  get '/posts/:id/edit' do 
  	@post = Post.find(params[:id])
  	erb :'edit_post'
	end

  patch '/posts/edit/:id' do 
  	@post = Post.find(params[:id])
  	@post.update(params[:post][:update])
  	redirect "posts/#{@post.id}"
	end	

	delete '/posts/delete/:id' do 
		@post = Post.find(params[:id])
		@post.destroy
		"#{@post.name} was deleted."	
  end

end