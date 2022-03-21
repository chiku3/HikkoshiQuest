class Quest < ApplicationRecord
  belongs_to :user
  has_many :quest_tasks, dependent: :destroy

  validates :due_day, presence: true
  validates :start_pref, presence: true
  validates :start_city, presence: true
  validates :goal_pref, presence: true
  validates :goal_city, presence: true

  validate :day_check
  def day_check
    errors.add(:due_day, 'は今日以降の日付を選択してください。') if due_day.present? && (due_day < Date.today)
  end

  def title
    goal_city + 'を目指そう！'
  end

  def date_title
    goal_city + 'を目指そう！(' + due_day.strftime('%Y/%m/%d') + ')'
  end
  
    
  
end