class SessionsController < ApplicationController
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
    end
    # if user exists and if user is authenticated, log them in
    # if not, render :new view with flash message
  end
end