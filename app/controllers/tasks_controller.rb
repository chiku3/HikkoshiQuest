class TasksController < ApplicationController
  def show
  end

  def update
  end

  private

  def task_params
    params.require(:task).permit(:name, :title, :body_a, :body_b, :image)
  end
end
