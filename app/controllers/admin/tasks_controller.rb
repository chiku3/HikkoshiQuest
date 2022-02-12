class Admin::TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to admin_task_path(@task)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to admin_task_path(@task)
  end
  
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to admin_home_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :importance, :image)
  end
end