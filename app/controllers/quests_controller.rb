class QuestsController < ApplicationController
  def new
    @user = current_user
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def clear
  end

  def complete
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :task_id, :title, :due_day,
    :start_point, :start_point_city, :goal_point, :goal_point_city, :is_clear)
  end
end
