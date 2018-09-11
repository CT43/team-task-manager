class ListsController < ApplicationController


  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = session[:user_id]

    if @list.valid?
      @list.save
      redirect_to user_list_path(current_user, @list)
    else
      render :new
    end
  end


  def index
    if params[:user_id]
      @lists = User.find(params[:user_id]).lists
    else
      @lists = List.all
    end
  end

  def show
    @list = List.find_by(id: params[:id])
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
