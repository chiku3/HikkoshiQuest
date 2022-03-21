class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :quests, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_notifications, foreign_key: 'visitor_id', class_name: 'Notification', dependent: :destroy
  has_many :passive_notifications, foreign_key: 'visited_id', class_name: 'Notification', dependent: :destroy

  validates :name, presence: true
end
