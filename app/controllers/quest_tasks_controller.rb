class QuestTasksController < ApplicationController
  def show
    @quest_task = QuestTask.find(params[:id])
    @quest = @quest_task.quest_id
  end

  def update
    @quest_task = QuestTask.find(params[:id])
    @quest = @quest_task.quest_id
    @quest_task.update(quest_task_params)
    redirect_to quest_path(@quest)
  end

  def complete
    @quest_task = QuestTask.find(params[:id])
    @quest = @quest_task.quest_id
  end

  private

  def quest_task_params
    params.require(:quest_task).permit(:quest_id, :task_id, :is_clear)
  end
end
