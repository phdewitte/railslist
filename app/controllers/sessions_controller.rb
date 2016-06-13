class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    p @user
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      @error = "Your login credentials are invalid"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, :notice => "Logged out!"
  end
end
