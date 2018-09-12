class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def home
  end

  def new
     @user = User.new
   end

   def show
     @user = current_user
   end

   def create
    @user = User.new(user_params)
     if !params[:new_team_name].empty?
       @team = Team.create(name: params[:new_team_name])
       @user.team = @team
     end
     respond_to do |format|
       if @user.save
         session[:user_id] = @user.id
         format.html { redirect_to user_path(@user), notice: "Hi" }
       else
         format.html { render :new }
       end
     end
   end

   def update
     respond_to do |format|
       if @user.update(user_params)
         format.html { redirect_to @user, notice: 'User was successfully updated.' }
       else
         format.html { render :edit }
       end
     end
   end

   def edit
   end


  private
   # Use callbacks to share common setup or constraints between actions.
   def set_user
     @user = User.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def user_params
     params.require(:user).permit( :name, :password, :email, :position, :team_id, :new_team_name)
   end
end
