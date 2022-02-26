# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    association :lesson
    title { 'who is joe' }
    time_limit { '30' }
    question_type { 'multiple_choice' }
  end
end
