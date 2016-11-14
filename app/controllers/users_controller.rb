class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def edit
	  @user = current_user
  end

  def update
	  @user = User.find params[:id]
	  if @user.update(user_params)
		  flash[:notice] = "Successfully edited information!"
		  redirect_to home_path
	  end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
