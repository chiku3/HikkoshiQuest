class Quest < ApplicationRecord

belongs_to :user
has_many :quest_tasks, dependent: :destroy

def title
  goal_city + "を目指そう！"
end

end
