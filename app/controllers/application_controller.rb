class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :decision_user?

  private

  # def current_user
  #   return session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end

  def decision_user?
    current_user == :nickname
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, notice: 'ログインしてください'
  end
end
