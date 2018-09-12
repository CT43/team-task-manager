class TasksController < ApplicationController

  def update
    task = Task.find_by(id: params[:id])
    task.completed = params[:task][:completed]
    task.save
  end

  def tasks_to_complete

  end 

  def edit
  end

  def show

  end

  def create

  end

end
