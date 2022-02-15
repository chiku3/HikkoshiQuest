class QuestTask < ApplicationRecord
  
  
belongs_to :quest,optional: true
belongs_to :task,optional: true
  
end
