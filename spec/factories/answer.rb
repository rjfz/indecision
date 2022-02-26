# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    association :question
    value { Faker::Lorem.sentence }
    correct { [true, false].sample }
  end
end
