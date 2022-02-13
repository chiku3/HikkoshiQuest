class QuestsController < ApplicationController
  def new
    @user = current_user
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
       redirect_to quest_path(@quest)
    else
       render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
  end

  def edit
  end

  def updates
  end

  def clear
  end

  def complete
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :task_id, :title, :due_day, 
    :start_pref, :start_city, :goal_pref, :goal_city, :is_clear)
  end
end
