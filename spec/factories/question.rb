# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    association :lesson
    title { 'who is joe' }
    time_limit { '30' }
  end
end
