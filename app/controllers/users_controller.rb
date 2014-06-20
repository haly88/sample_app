class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate, only: [:edit, :update]
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
        sign_in @user
        redirect_to @user, flash: {success: "Welcome to the Sample App!"}
      else
  	   @title = "Sign up"
  	   render :new
     end
  end

  def edit
    @title = "Edit user"
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, flash: {success: "Profile updated."}
    else
      @title = "Edit user"
      render :edit
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

  def authenticate
    deny_access unless signed_in?
  end
end
