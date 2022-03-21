class Board < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(board_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id)
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      board_id: id,
      comment_id: comment_id,
      visited_id: visited_id
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
