class ExercisesController < ApplicationController

  get '/exercises' do
    if logged_in?
      @exercises = Exercise.all
      erb :'exercises/exercises'
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


end
