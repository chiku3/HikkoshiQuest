class UsersController < ApplicationController
  def mypage
    @quest = Quest.find_by(is_clear: false, user_id: current_user)
    @quests = Quest.where(is_clear: true).where(user_id: current_user)
    @boards = Board.where(user_id: current_user).page(params[:page]).per(5)
    @quest_tasks = QuestTask.where(quest_id: @quest).where('task_id < ?', 5)
  end

  def show; end

  def edit; end

  def update
    current_user.update(user_params)
    redirect_to users_path
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
