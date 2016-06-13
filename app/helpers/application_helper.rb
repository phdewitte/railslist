module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout(user)
    session.delete(:user_id)
  end

  def logged_in?
    session[:user_id] != nil
  end

  def check_logged_in
    redirect '/login' unless logged_in?
  end
end
