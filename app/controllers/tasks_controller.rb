class TasksController < ApplicationController

  def update
    task = Task.find_by(id: params[:id])
    task.completed = params[:task][:completed]
    task.save
  end

  def edit
  end

  def show
    
  end

end
