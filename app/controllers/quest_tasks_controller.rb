class QuestTasksController < ApplicationController

  def show
    @quest_task = QuestTask.find(params[:id])
  end

  def update
  end
  
  private

  def quest_task_params
    params.require(:quest_task).permit(:quest_id, :task_id, :is_clear)
  end
end
