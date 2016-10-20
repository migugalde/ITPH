class CounselorController < ApplicationController

#   def counselor_params
#       params.require(:counselor).permit(:name, :email, :password, :password_confirmation)
#   end
  
  def show
    id = params[:id]
    @counselor = Counselor.find(id)
  end
  
  def index
    @counselors = Counselor.all
  end

  def new
    # default: render 'new' template
    @counselor = Counselor.new
  end

  def create
    @counselor = Counselor.create!(params[:email])
    flash[:notice] = "#{@counselor.username} was successfully created."
    if @counselor.save
        redirect_to counselors_new_path
    else
        render action: "new"
    end
  end

  def edit
    @counselor = Counselor.find params[:id]
  end

  def update
    @counselor = Counselor.find params[:id]
    @counselor.update_attributes!(params[:email])
    flash[:notice] = "#{@counselor.title} was successfully updated."
    redirect_to counselors_new_path
  end

  def destroy
    @counselor = Counselor.find(params[:id])
    @counselor.destroy
    flash[:notice] = "Counselor '#{@counselor.title}' deleted."
    redirect_to counselors_new_path
  end

end
