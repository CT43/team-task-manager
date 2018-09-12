class TasksController < ApplicationController

  def update
    task = Task.find_by(id: params[:id])
    task.completed = params[:task][:completed]
    task.save
  end

  def tasks_to_complete
    all_uncompleted_tasks = Task.tasks_to_complete
    @tasks = []
    all_uncompleted_tasks.each do |task|
      if current_user.list_ids.include?(task.list_id)
        @tasks << task
      end
    end
  end

  def edit
  end

  def show

  end

  def create

  end

end
