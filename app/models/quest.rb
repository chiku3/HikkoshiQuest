class Quest < ApplicationRecord

belongs_to :user
has_many :quest_tasks, dependent: :destroy
accepts_nested_attributes_for :quest_tasks

def title
  goal_city + "を目指そう！"
end

end
