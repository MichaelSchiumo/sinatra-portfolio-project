require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base



  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_password"
    use Rack::Flash, sweep: true
  end

  get '/' do
    erb :index
  end

  delete '/exercises/:id/delete' do
    if logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      if @exercise && @exercise.user == current_user
        @exercise.delete
      end
      redirect to '/exercises'
    else
      redirect to '/login'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
  end
end
