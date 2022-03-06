class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @board = @comment.board
    if @comment.save
       @board.create_notification_comment!(current_user, @comment.id)
       redirect_to board_path(@board)
    else
       redirect_to board_path(@board)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :user_id, :comment)
  end
end
