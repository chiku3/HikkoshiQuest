class UsersController < ApplicationController
  def mypage
    @user = current_user
    @quest = Quest.find_by(is_clear: false,user_id: current_user)
    @quests = Quest.where(is_clear: true)
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to users_path
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
