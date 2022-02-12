class Admin::BoardsController < ApplicationController
  def show
  end

  def destroy
  end
  
  private

  def board_params
    params.require(:board).permit(:title, :point, :city_point)
  end
end
