class ExercisesController < ApplicationController

  get '/exercises' do
    if logged_in?
      @exercises = Exercise.all
      erb :'/exercises/exercises'
    else
      redirect to '/login'
    end
  end

  get '/exercises/new' do
    if logged_in?
      erb :'/exercises/new'
    else
      redirect to '/login'
    end
  end

  post '/exercises' do
    if logged_in?
      if params["exercise"]["name"]= "" || params["exercise"]["muscle_group"]= ""
        flash[:message] "Please fill in all fields."
        redirect to '/exercises/new'
      else
          @user = current_user
          @exercise = Exercise.create(name: params["exercise"]["name"], muscle_group: params["exercise"]["muscle_group"], user_id: session[:user_id])
        if @exercise.save
          redirect to '/exercises/#{@exercise.id}'
        else
          redirect to '/exercises/new'
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/exercises/:id' do
    if logged_in?
      @exercise = @exercise.find_by_id[params(:id)]
      erb :'/tweets/show'
    end
  end

  get '/exercises/:id/edit' do
    if logged_in?
      @exercise = @exercise.find_by_id[params(:id)]
      if @exercise && @exercise.user == current_user
        redirect to '/exercises/edit'
      end
    end
  end

  patch '/exercises/:id' do
    if logged_in?
      
  end


end
