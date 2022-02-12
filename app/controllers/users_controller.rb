class UsersController < ApplicationController
  def mypage
    @user = current_user
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
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :image_id)
  end
end
