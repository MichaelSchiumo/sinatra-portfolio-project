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

  helpers do
    #refactored
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    #refactored to not rely on current_user method, removed double bang operator
    def logged_in?
      session.has_key?(:user_id)
    end
  end
end
