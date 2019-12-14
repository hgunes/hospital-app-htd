# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    practicing_from { Time.current - rand(20).years }
    sequence(:qualification_number) { |n| n }
    employment { 0 }
  end
end
