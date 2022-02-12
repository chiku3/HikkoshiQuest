class Admin::CommentsController < ApplicationController
  def destroy
  end
  
  private

  def comment_params
    params.require(:comment).permit(:board_id, :user_id, :title, :comment)
  end
end
