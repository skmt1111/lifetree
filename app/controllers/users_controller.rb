class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(nickname: params[:id])
  end
end
