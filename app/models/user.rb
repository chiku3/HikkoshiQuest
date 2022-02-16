class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  attachment :image
         
  has_one :quest, dependent: :destroy
  has_many :clear_quests, dependent: :destroy       
  has_many :comments, dependent: :destroy       
  
  
end
