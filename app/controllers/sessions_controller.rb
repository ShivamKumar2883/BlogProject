class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in"
      redirect_to user
    else
      # In case of redirect one full http request cycle is used but not in render.
      # Isliye flash.now is used to display the message in the same request cycle.
      flash.now[:alert] = "There was something wrong with your login details"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end
end
