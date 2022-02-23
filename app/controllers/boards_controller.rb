class BoardsController < ApplicationController
  def index
    @board = Board.new
    @boards = Board.all
  end

  def create
    @board = Board.new(board_params)
    @board.save
    redirect_to board_path(@board)
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(board_id: @board.id)
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :user_id)
  end

end
