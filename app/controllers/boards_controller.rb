class BoardsController < ApplicationController
  def index
  end

  def create
  end

  def show
  end

  private

  def board_params
    params.require(:board).permit(:title, :point, :city_point)
  end
end
