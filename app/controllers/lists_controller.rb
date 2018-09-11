class ListsController < ApplicationController


  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = session[:user_id]
    @list.save
    #binding.pry
    ##iterate over task[name] to create all instances of tasks
    #binding.pry


    redirect_to list_path(@list)
  end

  def show
    binding.pry
    @list = List.find_by(id: params[:id])
    binding.pry
  end

  # def update
  #   binding.pry
  #   @list = List.find_by(id: params[:id])
  # end


  private

    def list_params
      params.require(:list).permit(:name, task_ids:[], tasks_attributes: [:name])
    end

end
