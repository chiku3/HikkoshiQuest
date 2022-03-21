# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  factory :board do
    user_id       { '1' }
    title         { Faker::Lorem.characters(number: 10) }
    body          { Faker::Lorem.characters(number: 20) }
  end
end
