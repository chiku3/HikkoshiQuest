class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    board = comment.board.id
    redirect_to board_path(board)
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :user_id, :comment)
  end
end
