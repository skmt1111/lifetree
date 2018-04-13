class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(nickname: params[:id])

    if logged_in?
      if @user.id == current_user.id
        render :self_show
      else
        if @user.public == false
          render :private
        else
          render :show
        end
      end
    else
      if @user.public == false
        render :private
      else
        render :show
      end
    end
  end

  def edit
    @user = User.find_by(nickname: params[:id])
  end

  def update
    @user = User.find_by(nickname: params[:id])

    if @user.update(user_params)
      redirect_to root_url, notice: '登録しました'
    else
      render :edit, notice: '登録できませんでした'
    end
  end

  private

  def user_params
    params.require(:user).permit(:public)
  end
end
