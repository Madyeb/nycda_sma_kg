class SessionsController < ApplicationController
  before_action :authenticate, only: [:destroy]

  def new
  end

  def create
    # find user by email address

    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Signed in!"
      redirect_to students_path
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end
end