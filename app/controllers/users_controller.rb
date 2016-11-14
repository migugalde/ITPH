class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      SendEmailJob.set(wait: 20.seconds).perform_later(@user)
      redirect_to home_path
    else
      render 'new'
    end
  end
  
  def edit
	  @user = User.find params[:id]
  end
  
  def update
	  @user = User.find params[:id]
	  if @user.update(user_params)
		  flash[:notice] = "Successfully edited counselor!"
		  redirect_to home_path
	  end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
