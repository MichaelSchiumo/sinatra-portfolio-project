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

  #refactored and added flash message
  post '/exercises' do
    if params["exercise"]["name"]== "" || params["exercise"]["muscle_group"]== ""
        flash[:message] = "Please fill in all fields."
        redirect to '/exercises/new'
    else
      @user = current_user
      @exercise = Exercise.create(name: params["exercise"]["name"], muscle_group: params["exercise"]["muscle_group"], user_id: session[:user_id])
      @exercise.user_id = @user.id
      @exercise.save
      redirect to "/exercises"
    end
  end

  get '/exercises/:id' do
    if logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      erb :'/exercises/show'
    end
  end

  get '/exercises/:id/edit' do
    @exercise = Exercise.find_by_id(params[:id])
    if logged_in? && @exercise && @exercise.user == current_user
      erb :'/exercises/edit'
    else
        redirect to '/exercises'
    end
  end

  #added flash message
  delete '/exercises/:id/delete' do
    @exercise = Exercise.find_by_id(params[:id])
    if @exercise && @exercise.user == current_user
      @exercise.delete
    end
      flash[:message] = "Your exercise has been deleted."
      redirect to '/exercises'
  end

#refactor patch (utilize active record and don't create empty objects)
#simplified to not use any if/else statements
#added flash message
  patch '/exercises/:id' do
    @exercise = Exercise.find_by_id(params[:id])
    @exercise && @exercise.user == current_user
    @exercise.update(name: params["exercise"]["name"], muscle_group: params["exercise"]["muscle_group"])
      flash[:message] = "Nice job! You have successfully updated this exercise."
      redirect to "/exercises/#{@exercise.id}"
  end
end
