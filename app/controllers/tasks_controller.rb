class TasksController < ApplicationController
  def show
  end

  def update
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :do_time,
    :importance, :enemy_image_id)
  end
end
