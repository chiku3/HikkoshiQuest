class ClearQuest < ApplicationRecord
  
  belongs_to :user
  
  def title
    goal_city + "を目指そう！"
  end
  
end
