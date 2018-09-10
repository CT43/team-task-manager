class ListsController < ApplicationController


  def new
    @list = List.new
  end

  def create
    @list = List.new(name: params[:name].to_s)
    @list.user_id = session[:user_id]
    @list.save

    ##iterate over task[name] to create all instances of tasks
    @tasks = params[:task][:name]
    @tasks = @tasks.reject { |c| c.empty? }
    @tasks.each do |task|
      @task = Task.new(name: task)
      @task.list_id = @list.id
      @task.save
    end
    redirect_to list_path
  end
  
end
