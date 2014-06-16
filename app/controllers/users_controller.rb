class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
  	@title = @user.name
  end
  
  def new
  	@user = User.new
  	@title = "Sign up"
  end

  def create
  	@user = User.new(user_params)
      if @user.save
        redirect_to @user, flash: {success: "Welcome to the Sample App!"}
      else
  	   @title = "Sign up"
  	   render "new"
     end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
