class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery only: :index

  def logged_on?
  end

  def current_user
  end

  def login(user)
    token = User.new_session_token
    session[:session_token] = token
    user.update(session_token: token)
  end


end
