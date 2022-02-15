class Task < ApplicationRecord

has_many :quest_tasks, dependent: :destroy

attachment :image

end
