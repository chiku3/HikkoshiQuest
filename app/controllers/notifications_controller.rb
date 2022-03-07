class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications
      @notifications.where(checked: false).each do |notification|
        notification.update_attributes(checked: true)
      end
    @notification = @notifications.where.not(visitor_id: current_user.id)
  end

  private

  def notification_params
    params.require(:notification).permit(:visited_id, :visitor_id, :board_id, :comment_id, :checked)
  end

end
