class TasksController < ApplicationController

  def update
    task = Task.find_by(id: params[:id])
    if current_user.position > task.list.user.position || current_user.list_ids.include?(task.list_id)
      task.completed = params[:task][:completed]
      task.save
    else
      redirect_to user_lists_path(current_user)
    end
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

  def create
  end

end
