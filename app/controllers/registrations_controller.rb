class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(permit_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "successfully created account"
      redirect_to mains_path
    else
      render :new
    end
  end


  private

  def permit_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end


