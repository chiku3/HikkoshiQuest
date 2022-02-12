class Task < ApplicationRecord

has_many :quests, dependent: :destroy

attachment :image

end
