FactoryBot.define do
  factory :comment do
    user_id       {"1"}
    board_id      {"1"}
    comment       {Faker::Lorem.characters(number:20)}
  end
end