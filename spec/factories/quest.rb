FactoryBot.define do
  factory :quest do
    user_id       { '1' }
    due_day       { Faker::Date.forward }
    start_pref    { '北海道' }
    start_city    { '札幌市' }
    goal_pref     { '北海道' }
    goal_city     { '旭川市' }
    is_clear      { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end
