class BoardsController < ApplicationController
  def index
    @board = Board.new
    if params[:word].present?
      @boards = Board.where('title LIKE ? OR body LIKE ?', "%#{params[:word]}%", "%#{params[:word]}%").order(created_at: "DESC").page(params[:page])
      @word = params[:word]
    else
      @boards = Board.all.order(created_at: "DESC").page(params[:page]).per(20)
    end
  end

  def create
    @board = Board.new(board_params)
    @board.save
    redirect_to board_path(@board)
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    if params[:word].present?
      @comments = Comment.where('comment LIKE ?', "%#{params[:word]}%").order(created_at: "DESC").page(params[:page])
      @word = params[:word]
    else  
      @comments = Comment.where(board_id: @board.id).order(created_at: "DESC").page(params[:page])
    end
  end


  private

  def board_params
    params.require(:board).permit(:title, :body, :user_id)
  end

end
