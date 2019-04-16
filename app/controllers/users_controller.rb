class UsersController < ApplicationController

  get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show'
  end
#log in and log out functionality

  get '/users/:id' do
    if !logged_in?
      redirect to '/login'
    else
      @user = current_user
      erb :'/users/show'
    end
  end

  get '/signup' do
    #binding.pry
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/exercises'
    end
  end

  post '/signup' do
    #if params[:username] = "" || params[:email] = "" || params[:password] = ""
      @user = User.new(params)
      if @user.save
        session[:user_id] = @user.id
        flash[:message] = "Welcome to Gym Buddy! It's time to get to work!"
        redirect to '/exercises'
      else
        flash[:messages] = @user.errors.full_messages
        redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to "/exercises"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/exercises'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "You have successfully been logged out. We hope to see you soon!"
      redirect to 'login'
    else
      redirect to '/'
    end
  end
end
